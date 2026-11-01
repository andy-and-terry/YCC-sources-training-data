# Positive n expressible as a*a + b*b with a, b >= 0.
def representable?(n)
  (0..Integer.sqrt(n)).any? do |a|
    b2 = n - a * a
    Integer.sqrt(b2)**2 == b2
  end
end

puts (1..30).select { |n| representable?(n) }.join(" ")
