require_relative 'node'
require 'benchmark'


# graph class
class Graph
  attr_accessor :nodes
  attr_accessor :root

  def initialize(file)
    @nodes = {}
    begin
      f = File.open(file)
      f.readlines.each do |line|
        values = line.split(';')
        id = values[0]
        letter = values[1]
        neebs = values[2].chomp("\n")
        nbrs = neebs.split(',')
        if id.nil? || letter.nil?
          puts 'puts invalid graph file'
          exit
        else
          node = Node.new(id, letter, nbrs)
          add_node(node)
        end
        invalid_graph if letter.length != 1
        invalid_graph if letter.match(/^[[:alpha:]]+$/) == false
        invalid_graph if integer?(id) == false
        nbrs.each do |nbr|
          unless nbrs.empty?
            invalid_graph if integer?(nbr) == false
          end
        end
      end
      f.close
    rescue Errno::ENOENT => e
      puts 'File could not be opened. Perhaps it doesnt exist?'
      puts e
      exit(-1)
    end
  end

  def search
    @nodes.keys.each do |key|
      @root = @nodes[key]
      traverse(@root, @root.letter)
    end
  end

  def traverse(node, cur_word)
    if node.num_neighbors > 0
      node.neighbors.each do |neighbor|
        new_node = get_node(neighbor)
        cur_word += new_node.letter
        traverse(new_node, cur_word)
        cur_word = cur_word.chop
      end
    else
      @root.words.push(cur_word)
    end
  end

  def num_nodes
    @nodes.keys.count
  end

  def get_node(id)
    @nodes[id]
  end

  def add_node(node)
    @nodes[node.id] = node
    node.id
  end

  def integer?(num)
    val = true if num.to_i.to_s == num
    val = false if num.to_i.to_s != num
    val
  end

  def invalid_graph
    puts 'invalid graph file'
    exit
  end
end
