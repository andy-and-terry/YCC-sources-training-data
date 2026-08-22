def prime?(n : Int32) : Bool
  return false if n < 2
  (2..Math.isqrt(n)).each do |i|
    return false if n % i == 0
  end
  true
end

puts (2..20).select { |n| prime?(n) }.to_a.inspect
