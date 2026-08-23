def prime?(n : Int32) : Bool
  return false if n < 2
  (2..Math.isqrt(n)).each { |i| return false if n % i == 0 }
  true
end

puts (2..30).select { |n| prime?(n) }.to_a.inspect
