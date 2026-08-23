def power(base : Int32, exp : Int32) : Int64
  result = 1_i64
  exp.times { result *= base }
  result
end

puts power(2, 10)
puts power(3, 5)
