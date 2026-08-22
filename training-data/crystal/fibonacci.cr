def fibonacci(n : Int32) : Array(Int32)
  result = [] of Int32
  a, b = 0, 1
  n.times do
    result << a
    a, b = b, a + b
  end
  result
end

puts fibonacci(11).inspect
