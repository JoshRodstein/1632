require 'sinatra'
require 'sinatra/reloader'
require_relative 'table_gen'

get '/' do
  erb :index, :locals => { error: 'This is an Error Message.' }
end

post '/' do
  true_symbol = params['true symbol']
  false_symbol = params['false symbol']
  size = params['size']

  true_symbol = 'T' if true_symbol == ''

  false_symbol = 'F' if false_symbol == ''

  size = if size == ''
           3
         else
           size.to_i
         end

  if true_symbol.length > 1 || false_symbol.length > 1
    puts("Invalid true False params")
    return erb :invalidParam, :locals => { message: 'Invalid Parameters', error: nil }
  end

  if true_symbol == false_symbol
    return erb :invalidParam, :locals => { message: 'Invalid Parameters', error: nil }
  end

  puts("True: #{true_symbol}, False: #{false_symbol}, Size: #{size}")
  
  if size.to_i < 2
    puts("Invalid size param")
    return erb :invalidParam, :locals => { message: 'Invalid Parameters', error: nil }
  end
  puts("now loop")

  table = TruthTable.new(true_symbol, false_symbol, size)

  erb :tableTemplate, :locals => { message: 'Truth Table Template', table_hash: table.table}
end

not_found do
  erb :invalidParam, :locals => { message: 'Invalid Address', error: 404 }
end
