require 'checkout'

describe Checkout do
  let (:heart) { double :item, price: 925 }
  let (:cufflinks) { double :item, price: 4500 }

  it 'should be able to scan an item' do
    subject.scan(heart)
    expect(subject.total).to eq 925
  end

  it 'should be able to produce a total of items' do
    subject.scan(heart)
    subject.scan(cufflinks)
    expect(subject.total).to eq 5425
  end


end