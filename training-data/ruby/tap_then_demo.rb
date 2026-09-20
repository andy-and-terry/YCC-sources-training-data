# Object#tap yields self for a side effect (e.g. logging) and returns
# the receiver unchanged; Object#then (aka yield_self) yields self and
# returns the block's result, useful for readable pipelines.
result = [5, 3, 8, 1, 9, 2]
              .tap { |arr| puts "before sort: #{arr.inspect}" }
              .sort
              .tap { |arr| puts "after sort: #{arr.inspect}" }
              .then { |arr| arr.first + arr.last }

puts "min + max: #{result}"

celsius = 21.5
fahrenheit = celsius.then { |c| c * 9.0 / 5 }.then { |f| f + 32 }
puts "#{celsius}C is #{fahrenheit}F"
