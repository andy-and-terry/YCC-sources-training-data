# Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
def phi(n)
  (1..n).count { |k| k.gcd(n) == 1 }
end

def perfect_totient?(n)
  total = 0
  m = n
  while m > 1
    m = phi(m)
    total += m
  end
  total == n
end

puts (2...200).select { |n| perfect_totient?(n) }.join(" ")
