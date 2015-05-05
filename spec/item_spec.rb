describe Item do

  heart = Item.new({price: 925})

  it 'has a price' do
    expect(heart).to respond_to :price
  end

  it 'sets its price when created' do
    expect(heart.price).to eq 925
  end

  it 'has a product code' do
    expect(heart).to respond_to :product_code
  end

end