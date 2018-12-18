require_relative 'city'

# shutup
class Map
  attr_reader :cities
  def initialize
    @cities = []
    add_city('Nevada City', ['Angels Camp'], 0, 5)
    add_city('Angels Camp', ['Nevada City', 'Sutter Creek', 'Virginia City'], 0, 4)
    add_city('Sutter Creek', ['Angels Camp', 'Coloma'], 0, 2)
    add_city('Virginia City', ['Angels Camp', 'Coloma', 'Midas', 'El Dorado Canyon'], 3, 3)
    add_city('Coloma', ['Virginia City', 'Sutter Creek'], 0, 3)
    add_city('Midas', ['Virginia City', 'El Dorado Canyon'], 5, 0)
    add_city('El Dorado Canyon', ['Virginia City', 'Midas'], 10, 0)
  end

  # add a city to the map
  def add_city(name, connections, silver, gold)
    @cities.push(City.new(name, connections, silver, gold))
  end

  # returns city object if it exists
  def get_city(name)
    @cities.select { |a| a.name == name }.first
  end
end
