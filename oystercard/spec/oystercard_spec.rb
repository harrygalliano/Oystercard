require 'oystercard'

describe Oystercard do
  subject(:card) { Oystercard.new }

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
      # expect {top_up}.to change {balance}.by(5)
    end
  end

  it 'Error msg raised when max balance reached' do
    expect { card.top_up(100) }.to raise_error('Max balance reached')
  end

  context '#deduct' do
    it 'responds to deduct method' do
      expect(card).to respond_to(:deduct)
    end

    it 'balance should change when deducted' do
      expect(card.deduct(2)).to be < 0
    end

    it "it doesn't allow entry - balance below Minimum fare" do
      expect { card.touch_in }.to raise_error "Not enough funds - Minimum balance needed is: #{Oystercard::MINIMUM_FARE}"
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
      card.top_up(Oystercard::MINIMUM_FARE)
      expect(card.touch_in).to eq(true)
    end

    it 'ends a journey when you touch out' do
      expect(card.touch_out).to eq(false)
    end

    it 'is in journey' do
      card.top_up(Oystercard::MINIMUM_FARE)
      # when you create the card in subject(card), journey is set to false 
      card.touch_in # journey is set to true true
      # expect([]).to be_empty # this calls [].empty? to return true
      expect(card).to be_in_journey # this calls card.in_journey? to return true

      # (card.touch_in) returns true, and the .to be_in_journey sens the in_journey message to the return of card.touch_in
      # it dosen't work because true dosent respond to in_journey? methods
    end
    
    it 'is not in journey' do
      card.touch_out
      expect(card).not_to be_in_journey
    end
  end
end




