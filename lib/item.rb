class Item
  attr_reader :price, :product_code, :name

  def initialize(options)
    @price = options[:price]
    @name = options[:name]
    @product_code = options[:product_code]
  end
end
