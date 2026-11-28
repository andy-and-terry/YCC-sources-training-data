def prime?(n : Int32) : Bool
  return false if n < 2
  (2..Math.isqrt(n)).none? { |d| n % d == 0 }
end

n = 28
(2..n // 2).each do |p|
  puts "#{p} + #{n - p}" if prime?(p) && prime?(n - p)
end
