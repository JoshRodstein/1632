require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require_relative 'utils'
require_relative 'graph'

# Shutup rubocop
class AllTests < Minitest::Test
  # Utils.rb tests

  def test_no_args_exception
    assert_raises ArgumentError do
      argval?
    end
  end

  def test_one_arg
    result = argval?(['arg'])
    assert result.instance_of?(String)
  end

  def test_two_args_exception
    assert_raises ArgumentError do
      argval?(['arg'], ['arg2'])
    end
  end

  def test_wordlist_file_doesnt_exist
    assert_raises SystemExit do
      wordlist('nonExitentFile.txt')
    end
  end

  def test_wordlist_file_exists
    assert wordlist('wordlist.txt').instance_of?(Array)
  end

  def test_permute_find_cake
    test_g = Graph.new('small_graph.txt')
    test_g.search
    test_list = wordlist('wordlist.txt')
    test_found = permute(test_g, test_list)
    assert_equal test_found[0], 'cake'
  end

  # Node.rb tests

  def test_num_neighbors
    test_node = Node.new(1, 'A', %w[B C D])
    assert_equal test_node.num_neighbors, 3
  end

  def test_add_word
    test_node = Node.new(1, 'A', %w[B C D])
    test_node.add_word('test')
    assert_equal test_node.words?, 1
  end

  def test_words?
    test_node = Node.new(1, 'A', %w[B C D])
    test_node.add_word('test')
    test_node.add_word('test2')
    test_node.add_word('test3')
    assert_equal test_node.words?, 3
  end

  def test_to_s
    test_node = Node.new(1, 'A', %w[B C D])
    test_node.add_word('test')
    test_node.add_word('test2')
    test_node.add_word('test3')
    assert_equal test_node.to_s, 'Starting from node 1: [test,test2,test3]'
  end

  # Graph.rb tests

  def test_graph_init_file_exists
    test_g = Graph.new('small_graph.txt')
    assert test_g.nodes
  end

  def test_graph_init_non_file_exception
    assert_raises SystemExit do
      Graph.new('fake.txt')
    end
  end

  def test_search_generates_graph
    test_g = Graph.new('small_graph.txt')
    test_g.search
    assert_equal test_g.nodes['1'].letter, 'C'
    assert_equal test_g.nodes['2'].letter, 'A'
    assert_equal test_g.nodes['3'].letter, 'K'
    assert_equal test_g.nodes['4'].letter, 'T'
    assert_equal test_g.nodes['5'].letter, 'E'
    assert_equal test_g.nodes['6'].letter, 'B'
  end

  def test_num_nodes
    test_g = Graph.new('small_graph.txt')
    test_g.search
    assert_equal test_g.num_nodes, 6
  end

  def test_add_node
    test_g = Graph.new('small_graph.txt')
    test_node = Node.new(1, 'A', %w[B C D])
    test_g.add_node(test_node)
    assert_equal test_g.num_nodes, 7
  end

  def test_get_node
    test_g = Graph.new('small_graph.txt')
    test_node = test_g.get_node('2')
    assert_equal test_node.id, '2'
    assert test_node.instance_of?(Node)
  end
end
