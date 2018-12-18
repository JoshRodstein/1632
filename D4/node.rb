# Node Class
require 'benchmark'


class Node
  attr_accessor :neighbors, :id, :letter, :words

  def num_neighbors
    @neighbors.count
  end

  def add_word(word)
    @words.push(word)
  end

  def words?
    @words.count.nonzero?
  end

  def initialize(id, letter, neighbors)
    @id = id
    @letter = letter
    @neighbors = []
    @words = []
    neighbors.each { |n| @neighbors << n } if neighbors.count.nonzero?
  end

  def to_s
    word_ids = words? ? @words.join(',') : ''
    "Starting from node #{@id}: [#{word_ids}]"
  end
end
