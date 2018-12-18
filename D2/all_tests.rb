require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require_relative 'map'
require_relative 'utils'
require_relative 'prospector'

# This is a comment to shut rubocop up
class AllTests < Minitest::Test
  # Requirement 1:

  # UNIT TESTS FOR METHOD valid?(x)
  # Equivalence classes:
  # -INF < x < 0 -> returns 1
  # x = 0 -> returns 1
  # n < x < 2n (where n is a non-neg integer) -> return 1
  # type of x is String -> return 1
  # 0 < x <= INF -> returns 0

  # if a negative value is given for x then 1 is returned
  def test_exit_on_negative_input_negative_one
    assert_equal valid?(-1), 1
  end

  # if type of x is a string then 1 is returned
  # EDGE CASE
  def test_exit_on_non_int_input_string
    assert_equal valid?('one'), 1
  end

  # if type of x passed as float then number is rounded down to whole, (i.e. 1.9 -> 1)
  # EDGE CASE
  def test_exit_on_non_int_input_float
    assert_equal valid?(2.0), 0
  end

  # if value of x is 0 then 1 is returned
  def test_exit_on_input_zero
    assert_equal valid?(0), 1
  end

  # if x is a non-negative integer then 0 is returned
  def test_valid_args_one
    assert_equal valid?(1), 0
  end

  # UNIT TESTS FOR METHOD arg_num?(args_array)
  # Equivalence classes:
  # x.length < 2 -> then 1 is returned
  # x.length > 2 -> then 1 is returned
  # x.length == 2 -> then 0 is returned

  # if args_array.length > 2 then 1 is returned
  def test_exit_on_three_ints_input
    args = [1, 2, 3]
    assert_equal arg_num?(args), 1
  end

  # if args_array.length < 2 then 1 is returned
  def test_exit_on_one_int_input
    args = [1]
    assert_equal arg_num?(args), 1
  end

  # if args_array.length == 2 then 0 is returned
  def test_two_int_input
    args = [1, 2]
    assert_equal arg_num?(args), 0
  end

  # UNIT TESTS FOR MNETHOD seed_generator()
  # Equivalence classes:
  # seed > 0 -> random number netween 1 and seed is returned
  # seed < 1 -> nil is returned

  # if 1 is passed as seed, the number 1 is returned
  def test_random_number_is_generated_from_seed_is_one
    assert_equal seed_generator(1), 1
  end

  # if large non neg int is passed as seed, then number > 0 and <= seed is returned
  def test_random_number_is_generated_from_seed_maxint
    assert_equal seed_generator(999_999_999_999) <= 999_999_999_999, true
  end

  # if 0 is passed, nil is returned
  def test_random_number_is_generated_from_seed_0
    assert_nil seed_generator(0)
  end

  # if string is passed, then nil is returned
  # EDGE CASE
  def test_random_number_is_generated_from_seed_string
    assert_nil seed_generator('not a number')
  end

  # UNIT TESTS FOR METHOD Map initialize
  # Equivalence classes: none

  # Map shopuld initialize Virginia City with connections 'Angels Camp', 'Coloma', 'Midas', 'El Dorado Canyon'
  def test_virginia_city_to_midas_eldorado_coloma_angelscamp
    test_map = Map.new
    test_city = test_map.get_city('Virginia City')
    test_connections = ['Angels Camp', 'Coloma', 'Midas', 'El Dorado Canyon']
    assert_equal test_city.connections.all? { |c| test_connections.include?(c) }, true
  end

  # Map shopuld initialize Midas with connections 'El Dorado Canyon', 'Virginia City'
  def test_midas_to_eldoradocanyon_virginiacity
    test_map = Map.new
    test_city = test_map.get_city('Midas')
    test_connections = ['El Dorado Canyon', 'Virginia City']
    assert_equal test_city.connections.all? { |c| test_connections.include?(c) }, true
  end

  # Map shopuld initialize Coloma with connections Sutter Creek, Virginia City
  def test_coloma_to_suttercreek_virginia_city
    test_map = Map.new
    test_city = test_map.get_city('Coloma')
    test_connections = ['Sutter Creek', 'Virginia City']
    assert_equal test_city.connections.all? { |c| test_connections.include?(c) }, true
  end

  # Map shopuld initialize Angels Camp with connections Sutter Creek, Virginia City, Nevada City
  def test_angelscamp_to_suttercreek_nevadacity_virginiacity
    test_map = Map.new
    test_city = test_map.get_city('Angels Camp')
    test_connections = ['Sutter Creek', 'Virginia City', 'Nevada City']
    assert_equal test_city.connections.all? { |c| test_connections.include?(c) }, true
  end

  # Map shopuld initialize Nevada City with connections Angels Camp
  def test_nevadacity_to_angelscamp
    test_map = Map.new
    test_city = test_map.get_city('Nevada City')
    test_connections = ['Angels Camp']
    assert_equal test_city.connections.all? { |c| test_connections.include?(c) }, true
  end

  # Map shopuld initialize Coloma with connections Angels Camp, Coloma
  def test_suttercreek_to_angelscamp_coloma
    test_map = Map.new
    test_city = test_map.get_city('Sutter Creek')
    test_connections = ['Angels Camp', 'Coloma']
    assert_equal test_city.connections.all? { |c| test_connections.include?(c) }, true
  end

  # Map shopuld initialize El Dorado Canyon with connections Midas, Virginia City
  def test_eldoradocanyon_to_midas_virginiacity
    test_map = Map.new
    test_city = test_map.get_city('El Dorado Canyon')
    test_connections = ['Midas', 'Virginia City']
    assert_equal test_city.connections.all? { |c| test_connections.include?(c) }, true
  end

  # Tests for Requirement 4
  def test_start_at_sutter_creek
    test_prospector = Prospector.new 'p1'
    assert_equal test_prospector.location, 'Sutter Creek'
  end

  # UNIT TESTS FOR METHOD search? method
  # Equivalence classes: None

  # test that search? returns a hash of found gold and silver
  def test_search_mines_for_ore
    test_prospector = Prospector.new 'p1'
    found = test_prospector.search?
    assert found.is_a?(Hash)
    assert_equal test_prospector.search?.key?('gold'), true
    assert_equal test_prospector.search?.key?('silver'), true
  end

  # UNIT TESTS FOR METHOD new_city?({'gold'=>x, 'silver'=>y})
  # Equivalence classes:
  # visited < 4 and x = 0 and y = 0 then method returns a new city
  # visited < 4 and x > 0 then method returns same/current city
  # visited < 4 and y > 0 then method returns same/current city
  # visited > 3 and x = 1 and y = 2 then method returns a new city
  # visited > 3 and x > 1 then method returns same/current city
  # visited > 3 and y > 2 then method returns same/current city

  # If at 1 of 1st 3 locations and no ore found, will return same location
  def test_leave_3rd_location_if_no_ore
    test_prospector = Prospector.new 'p1'
    results = { 'gold' => 0, 'silver' => 0 }
    test_prospector.visited = 3
    origin = test_prospector.location
    refute_equal origin, test_prospector.new_city?(results)
  end

  # If at 1 of 1st 3 locations and > 1 gold found, will return new location
  def test_stay_3rd_location_if_found_gold
    test_prospector = Prospector.new 'p1'
    results = { 'gold' => 1, 'silver' => 0 }
    test_prospector.visited = 3
    origin = test_prospector.location
    assert_equal origin, test_prospector.new_city?(results)
  end

  # If at 1 of 1st 3 locations and > 1 silver found, will return new location
  def test_stay_3rd_location_if_found_silver
    test_prospector = Prospector.new 'p1'
    results = { 'gold' => 0, 'silver' => 1 }
    test_prospector.visited = 3
    origin = test_prospector.location
    assert_equal origin, test_prospector.new_city?(results)
  end

  # If at 1 of last 2 locations and found one ounce or fewer of gold and two ounces or
  # fewer of silver, will return new location.
  def test_leave_4th_location_if_1_gold_2_silver
    test_prospector = Prospector.new 'p1'
    results = { 'gold' => 1, 'silver' => 2 }
    test_prospector.visited = 4
    origin = test_prospector.location
    refute_equal origin, test_prospector.new_city?(results)
  end

  # If at 1 of last 2 locations and found either two ounces or more of gold
  # will return the same location
  def test_stay_4th_location_if_2_gold_2_silver
    test_prospector = Prospector.new 'p1'
    results = { 'gold' => 2, 'silver' => 2 }
    test_prospector.visited = 4
    origin = test_prospector.location
    assert_equal origin, test_prospector.new_city?(results)
  end

  # If at 1 of last 2 locations and found either two ounces or more of silver
  # will return the same location
  def test_stay_4th_location_if_1_gold_3_silver
    test_prospector = Prospector.new 'p1'
    results = { 'gold' => 1, 'silver' => 3 }
    test_prospector.visited = 4
    origin = test_prospector.location
    assert_equal origin, test_prospector.new_city?(results)
  end

  # UNIT TESTS FOR METHOD travel
  # Equivalence classes: none

  # travel will choose at random from connecting cities avialable to origin city
  def test_travel_to_random_connecting_city
    test_prospector = Prospector.new 'p1'
    options = test_prospector.map.get_city(test_prospector.location).connections
    destination = test_prospector.travel
    assert options.include?(destination)
  end

  # search? increments visited once found ore goes below threshold
  def test_prospect_in_five_cities
    mocked_driver = Minitest::Mock.new('mocked driver')
    def mocked_driver.game_loop
      test_prospector = Prospector.new 'p1'
      loop do
        test_prospector.travel
        break if test_prospector.visited == 6
      end
      test_prospector.visited
    end
    assert_equal mocked_driver.game_loop, 6
  end

  # UNIT TESTS FOR METHOD mine
  # Equivalence classes:
  # City Min gold or silver = 0
  # City Max gold or silver < 11

  # mine will generate a random number between min and max passed into city initializer
  def test_mine_ore_within_range
    test_city = City.new('Test City Name', [], 0, 0)
    range = test_city.mine
    assert_includes 0..range['silver'], 0
    assert_includes 0..range['gold'], 0
  end

  # UNIT TESTS FOR METHOD mine_results
  # Equivalence classes:
  # gold || silver > 1
  # gold || silver = 0
  # gold && silver = 0
  # gold || silver = 1

  # will result in the return of plural 'ounces' for both silver and gold.
  def test_system_displays_2_discovered_material
    test_prospector = Prospector.new 'p1'
    p1 = Minitest::Mock.new 'p1'
    def p1.holdings
      { 'gold' => 2, 'silver' => 9 }
    end
    assert_equal test_prospector.mine_results(p1.holdings), "\t Found 2 ounces of gold and 9 ounces of silver."
  end

  # will result in singular 'ounce' for gold and plural 'ounces' for silver.
  def test_system_gold_ounce_and_silver_ounces
    test_prospector = Prospector.new 'p1'
    p1 = Minitest::Mock.new 'p1'
    def p1.holdings
      { 'gold' => 1, 'silver' => 9 }
    end
    assert_equal test_prospector.mine_results(p1.holdings), "\t Found 1 ounce of gold and 9 ounces of silver."
  end

  # will result in plural 'ounces' of gold and no silver included.
  def test_system_displays_gold_discovered_material
    test_prospector = Prospector.new 'p1'
    p1 = Minitest::Mock.new 'p1'
    def p1.holdings
      { 'gold' => 9, 'silver' => 0 }
    end
    assert_equal test_prospector.mine_results(p1.holdings), "\t Found 9 ounces of gold."
  end

  # will result in singular 'ounce' of gold and no silver.
  def test_system_displays_gold_discovered_material_1
    test_prospector = Prospector.new 'p1'
    p1 = Minitest::Mock.new 'p1'
    def p1.holdings
      { 'gold' => 1, 'silver' => 0 }
    end
    assert_equal test_prospector.mine_results(p1.holdings), "\t Found 1 ounce of gold."
  end

  # will result in no gold and plural 'ounces' of silver.
  def test_system_displays_silver_discovered_material
    test_prospector = Prospector.new 'p1'
    p1 = Minitest::Mock.new 'p1'
    def p1.holdings
      { 'gold' => 0, 'silver' => 14 }
    end
    assert_equal test_prospector.mine_results(p1.holdings), "\t Found 14 ounces of silver."
  end

  # will result in plural 'ounces' of gold and singular 'ounce' of silver.
  def test_system_displays_ounces_of_gold_and_ounce_of_silver
    test_prospector = Prospector.new 'p1'
    p1 = Minitest::Mock.new 'p1'
    def p1.holdings
      { 'gold' => 12, 'silver' => 1 }
    end
    assert_equal test_prospector.mine_results(p1.holdings), "\t Found 12 ounces of gold and 1 ounce of silver."
  end

  # will result in no gold and singular 'ounce' of silver.
  def test_system_displays_silver_discovered_material_1
    test_prospector = Prospector.new 'p1'
    p1 = Minitest::Mock.new 'p1'
    def p1.holdings
      { 'gold' => 0, 'silver' => 1 }
    end
    assert_equal test_prospector.mine_results(p1.holdings), "\t Found 1 ounce of silver."
  end

  # will result in no silver or gold found.
  def test_system_no_material_found
    test_prospector = Prospector.new 'p1'
    p1 = Minitest::Mock.new 'p1'
    def p1.holdings
      { 'gold' => 0, 'silver' => 0 }
    end
    assert_equal test_prospector.mine_results(p1.holdings), "\t Found no precious metals."
  end

  # UNIT TESTS FOR METHOD add_to_holdings( { x, y} )
  # Equivalency Classes:
  # 0 < x && 0 < y -> returns holdings hash
  # x < 0 || y < 0 -> raises exception "invalid arg erro"

  # if passed values non-neg ints, return holdings hash
  def test_add_to_holdings_non_neg_int
    test_prospector = Prospector.new 'p1'
    ore = { 'gold' => 5, 'silver' => 7 }
    test_prospector.add_to_holdings(ore)
    assert_equal test_prospector.holdings, ore
  end

  # if negative number passed raises exception
  # EDGE CASE
  def test_add_to_holdings_raises_exception
    test_prospector = Prospector.new 'p1'
    ore = { 'gold' => -1, 'silver' => 7 }
    assert_raises 'Invalid Argument Error!' do
      test_prospector.add_to_holdings(ore)
    end
  end

  # UNIT TESTS FOR METHOD print_holdings ( { x, y} )
  # Equivalency Classes:
  # x || y == 1 -> 'ounce' is displayed as weight
  # x || y < 1, x || y > 1 -> 'ounces' is displayed as weight

  # if ore is one, displays 'ounce', if ore is 0 displays 'ounces'
  def test_display_new_location_and_holdings_gold_one_silver_zero
    test_prospector = Prospector.new 'p1'
    test_prospector.holdings = { 'gold' => 1, 'silver' => 0 }
    test_prospector.prev_location = 'Sutter Creek'
    test_prospector.location = 'Coloma'
    message = "Heading from Sutter Creek to Coloma, holding 1 ounce of gold and 0 ounces of silver.\n"
    assert_output(message) { test_prospector.print_holdings }
  end

  # if ore is 0, displays 'ounce', if ore is > 1 displays 'ounces'
  def test_display_new_location_and_holdings_gold_zero_silver_one
    test_prospector = Prospector.new 'p1'
    test_prospector.holdings = { 'gold' => 4, 'silver' => 1 }
    test_prospector.prev_location = 'Sutter Creek'
    test_prospector.location = 'Coloma'
    message = "Heading from Sutter Creek to Coloma, holding 4 ounces of gold and 1 ounce of silver.\n"
    assert_output(message) { test_prospector.print_holdings }
  end

  # UNIT TESTS FOR METHOD calculate_price
  # Equivalence Classes: n/a

  # test that proper calculation of gold is happening
  def test_gold_total
    test_prospector = Prospector.new 'p1'
    ore = { 'gold' => 1, 'silver' => 0 }
    test_prospector.add_to_holdings(ore)
    assert_equal test_prospector.calculate_price(ore), 20.67
  end

  # test that proper calculation of silver is happening
  def test_silver_total
    test_prospector = Prospector.new 'p1'
    ore = { 'gold' => 0, 'silver' => 1 }
    test_prospector.add_to_holdings(ore)
    assert_equal test_prospector.calculate_price(ore), 1.31
  end

  # UNIT TESTS FOR METHOD print_final_results
  # Equivalency Classes:
  # holdings 'gold' or 'silver' == 1 -> use ounce
  # holdings 'gold' or 'silver' == 0 -> use ounces
  # holdings 'gold' or 'silver' > 1 -> ounces

  # if holdings amoutns are > 1, use ounces
  def test_print_final_results_ounces_greater_than_zero
    test_prospector = Prospector.new 'Prospector 1'
    test_prospector.days = 30
    test_prospector.holdings['gold'] = 3
    test_prospector.holdings['silver'] = 4
    message = "After 30 days, Prospector #1 returned to San Francisco with: \n" \
    "\t 3 ounces of gold\n" \
    "\t 4 ounces of silver\n" \
	"\t Heading home with $67.25.\n\n\n"
    assert_output(message) { test_prospector.print_final_results }
  end

  # if ore amounts are 0, use ounces
  def test_print_final_results_ounces_zero
    test_prospector = Prospector.new 'Prospector 1'
    test_prospector.days = 30
    test_prospector.holdings['gold'] = 0
    test_prospector.holdings['silver'] = 0
    message = "After 30 days, Prospector #1 returned to San Francisco with: \n" \
    "\t 0 ounces of gold\n" \
    "\t 0 ounces of silver\n" \
	"\t Heading home with $0.00.\n\n\n"
    assert_output(message) { test_prospector.print_final_results }
  end

  # if ore amounts are 1, use ounce
  def test_print_final_results_ounce_one
    test_prospector = Prospector.new 'Prospector 1'
    test_prospector.days = 30
    test_prospector.holdings['gold'] = 1
    test_prospector.holdings['silver'] = 1
    message = "After 30 days, Prospector #1 returned to San Francisco with: \n" \
    "\t 1 ounce of gold\n" \
    "\t 1 ounce of silver\n" \
	"\t Heading home with $21.98.\n\n\n"
    assert_output(message) { test_prospector.print_final_results }
  end
end
