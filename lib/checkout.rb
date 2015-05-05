class Checkout

  def initialize(discount_options={})
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
    sub_total*((100-@discount_rate)/100.0)
  end

end