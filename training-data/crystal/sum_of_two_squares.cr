# Positive n expressible as a*a + b*b with a, b >= 0.
def representable?(n : Int32) : Bool
  a = 0
  while a * a <= n
    b = Math.sqrt(n - a * a).round.to_i
    return true if a * a + b * b == n
    a += 1
  end
  false
end

puts (1..30).select { |n| representable?(n) }.join(" ")
