class Item

  attr_reader :price, :product_code

  def initialize(options)
    @price = options[:price]
  end

end