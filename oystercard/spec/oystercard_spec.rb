require 'oystercard'

describe Oystercard do

  subject(:card) {Oystercard.new}
  describe '#Balance' do

    it 'default balance is zero' do
      expect(card.balance).to eq Oystercard::START_BALANCE
    end
  end

  describe '#Top_up' do
    it 'Responds to top_up method' do
      expect(card).to respond_to(:top_up)
    end

    it 'Balance should change when topped up' do
      expect(card.top_up(5)).to eq(5)
      #expect {top_up}.to change {balance}.by(5)
    end
  end

  it 'Error msg raised when max balance reached' do
    expect{ card.top_up(100) }.to raise_error('Max balance reached')
  end

  describe '#deduct' do 
    it 'responds to deduct method' do 
      expect(card).to respond_to(:deduct)
    end 

  it 'balance should change when deducted' do 
    expect(card.deduct(2)).to eq(-2)
  end
end

   describe '#journey' do 
    it 'allows the customer to touch in and pass through the barriers' do
    expect(card).to respond_to(:touch_in)
  end

  it 'allows the customer to touch out and pass through the barriers' do
    expect(card).to respond_to(:touch_out)
  end

   it 'starts a journey when you touch in' do 
    expect(card.touch_in).to eq(true)
  end

   it 'ends a journey when you touch out' do 
    expect(card.touch_out).to eq(false)
  end


end

end




