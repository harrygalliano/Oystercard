class Oystercard
  START_BALANCE = 0
  MAX_BALANCE = 90
  attr_reader :balance

  def initialize(balance = START_BALANCE, journey = false)
    @balance = balance
    @journey = journey
  end

  def top_up(amount)
    fail 'Max balance reached' if (amount + balance) > MAX_BALANCE
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    journey = true
  end

  def touch_out
    journey = false
  end

end
