# Lucas numbers using a lazy enumerator.
lucas = Enumerator.new do |y|
  a, b = 2, 1
  loop do
    y << a
    a, b = b, a + b
  end
end

puts lucas.take(10).join(" ")
