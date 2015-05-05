class Checkout

  def initialize
    @items = []
  end

  def scan(item)
    @items << item
  end

  def total
    @items.map { |item| item.price}.inject(:+)
  end

end