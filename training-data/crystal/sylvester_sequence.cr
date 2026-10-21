require "big"

# Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1
s = BigInt.new(2)
8.times do |i|
  puts "s(#{i}) = #{s}"
  s = s * s - s + 1
end
