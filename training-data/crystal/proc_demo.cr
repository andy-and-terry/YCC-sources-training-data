square = ->(x : Int32) { x * x }
add = ->(a : Int32, b : Int32) { a + b }

puts [1, 2, 3, 4].map { |n| square.call(n) }.inspect
puts add.call(3, 4)
