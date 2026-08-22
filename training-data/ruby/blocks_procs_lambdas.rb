def call_with_block
  yield 10
end

add_one = ->(x) { x + 1 }
multiply = proc { |x, y| x * y }

puts call_with_block { |n| n * 2 }
puts add_one.call(5)
puts multiply.call(3, 4)
puts multiply.(3, 4)
