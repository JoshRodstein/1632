require_relative 'map'

# shut up
class Prospector
  attr_accessor :location
  attr_accessor :prev_location
  attr_accessor :visited
  attr_accessor :holdings
  attr_accessor :days
  attr_reader :map

  def initialize(name)
    @name = name
    @location = 'Sutter Creek'
    @map = Map.new
    @holdings = { 'gold' => 0, 'silver' => 0 }
    @visited = 1
    @days = 0
  end

  def add_to_holdings(found)
    raise 'Invalid Argument Error!' unless found['gold'] > -1 && found['silver'] > -1

    @holdings['gold'] += found['gold']
    @holdings['silver'] += found['silver']
    @holdings
  end

  # search for ore in mine of current city/location
  def search?
    puts "#{@name} Starting in Sutter Creek." if @days.zero?
    found = map.get_city(@location).mine
    add_to_holdings found
    puts mine_results(found)
    @days += 1
    new_city?(found)
    found
  end

  # check if amount of mined ore is enough to stay, or if prospector should try and different
  def new_city?(results)
    case @visited
    when 1..3
      travel if results['silver'].zero? && results['gold'].zero?
    when 4..5
      travel if results['silver'] < 3 && results['gold'] < 2
    end
    @location
  end

  # travel to next city
  def travel
    print_holdings if @visited < 5
    current = map.get_city(@location)
    nxt_str = current.connections.sample
    @prev_location = @location
    @location = nxt_str
    @visited += 1
    map.get_city(nxt_str).name
  end

  def print_holdings
    print "Heading from #{@prev_location} to #{@location}, holding #{city_results(@holdings)}\n"
  end

  def city_results(ore)
    gold_amount = ore['gold']
    silver_amount = ore['silver']
    gold_message = if gold_amount > 1 || gold_amount.zero? == true
                     "#{gold_amount} ounces of gold and "
                   else
                     "#{gold_amount} ounce of gold and "
                   end
    silver_message = if silver_amount > 1 || silver_amount.zero? == true
                       "#{silver_amount} ounces of silver."
                     else
                       "#{silver_amount} ounce of silver."
                     end
    gold_message.concat silver_message
  end

  def calculate_price(ore)
    gold_price = ore['gold'] * 20.67
    silver_price = ore['silver'] * 1.31
    gold_price + silver_price
  end

  # Add tabs to meet requirement 13
  def mine_results(ore)
    gold_amount = ore['gold']
    silver_amount = ore['silver']
    gold_message = if gold_amount > 1
                     "\t Found #{gold_amount} ounces of gold"
                   elsif gold_amount == 1
                     "\t Found #{gold_amount} ounce of gold"
                   elsif gold_amount.zero? == true && silver_amount.zero? == true
                     "\t Found no precious metals"
                   else
                     "\t "
                   end
    silver_message = if silver_amount > 1 && gold_amount.zero? == true
                       "Found #{silver_amount} ounces of silver."
                     elsif silver_amount == 1 && gold_amount.zero? == true
                       "Found #{silver_amount} ounce of silver."
                     elsif silver_amount > 1
                       " and #{silver_amount} ounces of silver."
                     elsif silver_amount == 1
                       " and #{silver_amount} ounce of silver."
                     else
                       '.'
                     end
    gold_message.concat silver_message
  end

  # print final results of entire trip
  def print_final_results
    total = calculate_price(@holdings)
    g_weight = if @holdings['gold'].equal? 1
                 'ounce'
               else
                 'ounces'
               end
    s_weight = if @holdings['silver'].equal? 1
                 'ounce'
               else
                 'ounces'
               end
    name = @name.insert(11, '#')
    puts "After #{@days} days, #{name} returned to San Francisco with: \n" \
    "\t #{@holdings['gold']} #{g_weight} of gold\n" \
    "\t #{@holdings['silver']} #{s_weight} of silver\n"
    puts format("\t Heading home with $%.2f.\n\n\n", total)
  end
end
