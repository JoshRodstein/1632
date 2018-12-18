require 'flamegraph'
require 'benchmark'
require 'trie'
require 'bigdecimal/math'
require_relative 'graph'
require_relative 'node'
require_relative 'utils'

# WordFinder to find words based on acyclic graph in given textfile
longest_word = []
found_array = []
w_size = 0

txtfile = argval?(ARGV)

g = Graph.new(txtfile) if txtfile
g.search

wordlist = wordlist('wordlist.txt')

found_array = permute(g, wordlist)

found_array.each do |found|
  f_length = found.length
  if w_size < f_length
    w_size = f_length
    longest_word = []
    longest_word.push(found)
  elsif w_size == found.length
    longest_word.push(found)
  end
end
longest_word = longest_word.uniq
puts 'The longest word/s is: '
puts longest_word

puts "  User\t\tSystem\tTotal\t\tReal"
puts Benchmark.measure { BigMath.PI(10_000) }
