feature 'As a customer I want to order items from an online marketplace' do
  co = Checkout.new
  heart = Item.new({ price: 925 })
  cufflinks = Item.new({ price: 4500 })

  scenario 'an order of a lavender heart and personalised cufflinks totals £54.25' do
    co.scan(heart)
    co.scan(cufflinks)
    expect(co.total).to eq 5425
  end

end