describe Checkout do
  let (:heart) { double :item, price: 925 }
  let (:cufflinks) { double :item, price: 4500 }

  it 'is able to scan an item' do
    subject.scan(heart)
    expect(subject.total).to eq 925
  end

  it 'is able to produce a total of items' do
    subject.scan(heart)
    subject.scan(cufflinks)
    expect(subject.total).to eq 5425
  end

  it 'applies a discount rate specified' do
    co = Checkout.new({discount_rate: 10})
    co.scan(cufflinks)
    expect(co.total).to eq 4050
  end

  it 'applies a discount rate specified when the basket reaches a certain amount' do
    co = Checkout.new({discount_rate: 10, discount_amount: 6000})
    3.times{ co.scan(cufflinks) }
    expect(co.total).to eq 12150
  end

  it 'does not apply a discount rate unless the basket is of a certain value' do
    co = Checkout.new({discount_rate: 10, discount_amount: 6000})
    co.scan(heart)
    expect(co.total).to eq 925
  end
end