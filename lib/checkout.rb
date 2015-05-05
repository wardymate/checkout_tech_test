class Checkout
  def initialize(discount_options = {})
    @discount_amount = discount_options[:discount_amount]
    @discount_rate = discount_options[:discount_rate] ||= 0
    @heart_discount = discount_options[:heart_discount] ||= 0
    @heart_discount_amount = discount_options[:heart_amount] ||= 0
    @basket = []
  end

  def scan(item)
    @basket << item
  end

  def total
    return sub_total if @discount_amount.nil?
    sub_total > @discount_amount ? (sub_total * ((100 - @discount_rate) / 100.0)).ceil.to_i : sub_total
  end

  private

  def sub_total
    @basket.map(&:price).inject(:+) - multibuy_discounts
  end

  def multibuy_discounts
    basket_heart_count >= @heart_discount_amount ? basket_heart_count * @heart_discount : 0
  end

  def basket_heart_count
    @basket.select { |item| item.product_code == 001 }.count
  end
end
