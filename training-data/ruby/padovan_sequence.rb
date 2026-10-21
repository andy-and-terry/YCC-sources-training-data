# Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
padovan = Enumerator.new do |y|
  a, b, c = 1, 1, 1
  loop do
    y << a
    a, b, c = b, c, a + b
  end
end

puts padovan.take(15).join(" ")
