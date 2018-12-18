# Truth Table Class
class TruthTable
  attr_accessor :table
  attr_accessor :truth
  attr_accessor :falth
  attr_accessor :size

  def initialize(true_symbol, false_symbol, size)
    @size = size
    @truth = true_symbol
    @falth = false_symbol
    @table = {}
    generate_table
    @table
  end

  def generate_table
    @table = {}
    (0...size).reverse_each do |x| 
      @table[x] = []
      var = @truth
      (0...size**2).each do |y|
        var = var_swap?(x, y, var)
        @table[x].push(var)
      end
    end
    @table["AND"] = []
    @table["OR"] = []
    @table["XOR"] = []
    calculate
  end

  def var_swap?(x, y, v)
    if (y % (2**x)).zero?
      v = if v == @falth
              @truth
            else 
              @falth
            end
    end
    v
  end 

  def calculate
    puts("in calculate")
    (0...size**2).each do |y|
      count = 0
      (0...size).each do |x|
        if @table[x][y] == @truth
          count = count + 1
        end
      end

      if count > 0
        @table["OR"].push(@truth)
      else
        @table["OR"].push(@falth)
      end 

      if count == size
        @table["AND"].push(@truth)
      else
        @table["AND"].push(@falth)
      end

      if count % 2 == 1
        @table["XOR"].push(@truth)
      else 
        @table["XOR"].push(@falth)
      end

    end
  end
end
