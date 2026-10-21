# Print the first 15 Pell numbers: P(n) = 2*P(n-1) + P(n-2)
a = 0_i64
b = 1_i64
15.times do |i|
  puts "P(#{i}) = #{a}"
  a, b = b, 2 * b + a
end
