# Primorials up to 1e6, including 1; expect 8.
def prime?(n : Int32) : Bool
  return false if n < 2
  d = 2
  while d * d <= n
    return false if n % d == 0
    d += 1
  end
  true
end

values = [1_i64]
acc = 1_i64
p = 2
loop do
  if prime?(p)
    acc *= p
    break if acc > 1_000_000
    values << acc
  end
  p += 1
end
puts "#{values.size} #{values}"
