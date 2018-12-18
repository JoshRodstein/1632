# validate # of input args is 2
# return one if any otehr # of args is passed
def arg_num?(args)
  return 1 if args.length != 2

  0
end

# check that input args are valid non-neg ints
# arg is converted to an int
# strings converted to 0.
# floats rounded down and decimal removed
def valid?(in_arg)
  ia = in_arg.to_i
  if ia <= 0
    puts "Invalid argument type for value #{in_arg}"
    1
  else
    0
  end
end

def seed_generator(in_arg)
  return nil if !in_arg.is_a?(Integer) || in_arg < 1

  num = rand(in_arg) + 1
  num
end
