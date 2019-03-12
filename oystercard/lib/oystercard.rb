class Oystercard
  START_BALANCE = 0
  MAX_BALANCE = 90
  MINIMUM_FARE = 1
  attr_reader :balance, :entry_station

  def initialize(balance = START_BALANCE, journey = false)
    @balance = balance
    @journey = journey
  end

  ### attr reader creates this
  # def test
  #   @test
  # end
  ###

  def top_up(amount)
    fail 'Max balance reached' if (amount + balance) > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "Not enough funds - Minimum balance needed is: #{MINIMUM_FARE}" if @balance < MINIMUM_FARE
    @entry_station = station
    @journey = true
  end

  def touch_out
   deduct(MINIMUM_FARE)
   @entry_station = nil
   @journey = false
  end

  def in_journey?
    @journey
  end

  private 

  def deduct(amount)
    @balance -= amount
  end


end

