feature 'As a customer I want to order items from an online marketplace' do
  let (:co) { Checkout.new }

  scenario 'an order of a lavender heart, personalised cufflinks and a kids t-shirt' do
    co.scan(:heart)
    co.scan(:cufflinks)
    expect(co.total).to eq 5425
  end

end