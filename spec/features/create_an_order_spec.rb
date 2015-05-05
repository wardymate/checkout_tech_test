feature 'As a customer I want to order items from an online marketplace' do
  co = Checkout.new
  heart = Item.new({ price: 925 })
  cufflinks = Item.new({ price: 4500 })
  kids_t_shirt = Item.new({ price: 1995 })

  scenario 'an order of a lavender heart and personalised cufflinks totals £54.25' do
    co.scan(heart)
    co.scan(cufflinks)
    expect(co.total).to eq 5425
  end

  scenario 'an order of a lavender heart, personalised cufflinks and kids t-shirt totals £66.78' do
    promotional_rules = { disount_amount: 6000, discount_rate: 10 }
    co = Checkout.new(promotional_rules)
    co.scan(heart)
    co.scan(cufflinks)
    co.scan(kids_t_shirt)
    expect(co.total).to eq 6678
  end
end