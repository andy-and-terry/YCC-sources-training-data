# Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
tribonacci = Enumerator.new do |y|
  a, b, c = 0, 0, 1
  loop do
    y << a
    a, b, c = b, c, a + b + c
  end
end

puts "Tribonacci: #{tribonacci.take(15).join(', ')}"
