require 'trie'

def argval?(args)
  if args.length != 1
    puts 'Enter ONE text file!'
    exit
  else
    args[0].to_s
  end
end

def wordlist(filename)
  wordlist = Trie.new
  begin
    f = File.open(filename)
    f.readlines.each do |line|
      word = line.split("\n")
      word.each do |w|
        w = w.chomp("\n")
        num = w.length
        wordlist.add(w, num)
      end
    end
    f.close
  rescue Errno::ENOENT => e
    puts 'File could not be opened. Perhaps it doesnt exist?'
    puts e
    exit(-1)
  end
  wordlist
end

def permute(graph, wordlist)
  found_array = []
  permutation_array = []
  graph.nodes.keys.each do |key|
    graph.nodes[key].words.each do |word|
      permutation_array.push(word.chars.to_a.permutation.map(&:join))
    end
  end

  permutation_array.each do |p_word|
    p_word.each do |word|
      word = word.downcase
      found_array.push(word) if wordlist.has_key?(word)
    end
  end
  found_array
end
