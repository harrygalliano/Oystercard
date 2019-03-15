require_relative 'oystercard.rb'

class Journey
  attr_reader :journeys, :entry_station, :exit_station

  def initialize
    @journeys = [ ]
  end

  def start(station)
    @entry_station = station
    @journeys << { :entry_station => station } #:exit_station => nil }
  end

  def finish(station)
    @exit_station = station
    @journeys[-1][:exit_station] = station
  end
end