class Item

  attr_reader :price, :product_code, :name

  def initialize(options)
    @price = options[:price]
    @name = options[:name]
  end

end