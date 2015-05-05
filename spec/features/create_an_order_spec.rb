feature 'As a customer I want to order items from an online marketplace' do
  heart = Item.new({ price: 925, product_code: 001 })
  cufflinks = Item.new({ price: 4500, product_code: 002 })
  kids_t_shirt = Item.new({ price: 1995, product_code: 003 })

  scenario 'an order of a lavender heart and personalised cufflinks totals £54.25' do
    co = Checkout.new
    co.scan(heart)
    co.scan(cufflinks)
    expect(co.total).to eq 5425
  end

  scenario 'an order of a lavender heart, personalised cufflinks and kids t-shirt totals £66.78' do
    promotional_rules = { discount_amount: 6000, discount_rate: 10 }
    co = Checkout.new(promotional_rules)
    co.scan(heart)
    co.scan(cufflinks)
    co.scan(kids_t_shirt)
    expect(co.total).to eq 6678
  end

  scenario 'an order of 2 lavender hearts and a kids t-shirt totals £36.95' do
    promotional_rules = { discount_amount: 6000, discount_rate: 10, heart_amount: 2, heart_discount: 75 }
    co = Checkout.new(promotional_rules)
    2.times { co.scan(heart) }
    co.scan(kids_t_shirt)
    expect(co.total).to eq 3695
  end

  scenario 'an order of 2 lavender hearts, personalised cufflinks and kids t-shirt totals £73.76' do
    promotional_rules = { discount_amount: 6000, discount_rate: 10, heart_amount: 2, heart_discount: 75 }
    co = Checkout.new(promotional_rules)
    2.times { co.scan(heart) }
    co.scan(kids_t_shirt)
    co.scan(cufflinks)
    expect(co.total).to eq 7376
  end
end