class Checkout

  def initialize(discount_options={})
    @discount_amount = discount_options[:discount_amount] ||= 0
    @discount_rate = discount_options[:discount_rate] ||= 0
    @basket = []
  end

  def scan(item)
    @basket << item
  end

  def sub_total
    @basket.map { |item| item.price}.inject(:+)
  end

  def total
  sub_total > @discount_amount ? sub_total*((100-@discount_rate)/100.0) : sub_total
  end

end