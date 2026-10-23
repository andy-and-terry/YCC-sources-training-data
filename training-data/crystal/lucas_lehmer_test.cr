def prime?(n : Int32) : Bool
  return false if n < 2
  d = 2
  while d * d <= n
    return false if n % d == 0
    d += 1
  end
  true
end

def lucas_lehmer?(p : Int32) : Bool
  return true if p == 2
  m = (1_i64 << p) - 1
  s = 4_i64
  (p - 2).times do
    s = (s * s - 2) % m
  end
  s == 0
end

puts((2..19).select { |p| prime?(p) && lucas_lehmer?(p) }.join(" "))
