# Derangement counts: D(n) = (n-1) * (D(n-1) + D(n-2)).
def derangements(n)
  a, b = 1, 0
  return a if n.zero?
  (2..n).each { |i| a, b = b, (i - 1) * (a + b) }
  b
end

puts (0...8).map { |i| derangements(i) }.join(" ")
