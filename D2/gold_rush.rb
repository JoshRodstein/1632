require_relative 'utils'
require_relative 'prospector'

# Valiate Input arguments ( length & type )
exit 1 if arg_num?(ARGV).equal? 1
exit 1 if !valid?(ARGV[0]).zero? || !valid?(ARGV[1]).zero?
in_args = []
in_args[0] = ARGV[0].to_i
in_args[1] = ARGV[1].to_i
p_num = 0
in_args[1].times do
  p_num += 1
  prospector = Prospector.new "Prospector #{p_num}"
  loop do
    prospector.search?
    break if prospector.visited == 6
  end
  prospector.print_final_results
end
