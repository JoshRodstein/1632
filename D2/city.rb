# shutup
class City
  # initialize city name, connecting cities
  attr_reader :name
  attr_reader :connections
  attr_reader :ore

  def initialize(name, connects, silver, gold)
    @name = name
    @connections = []
    @ore = { 'Max Silver' => silver, 'Max Gold' => gold }
    connects.each do |item|
      @connections.push(item)
    end
  end

  def mine
    silver = rand(0..@ore['Max Silver'])
    gold = rand(0..@ore['Max Gold'])
    { 'gold' => gold, 'silver' => silver }
  end
end
