# Motzkin numbers via recurrence.
def motzkin(n)
  m = [1, 1]
  (2..n).each { |i| m << ((2 * i + 1) * m[i - 1] + 3 * (i - 1) * m[i - 2]) / (i + 2) }
  m[n]
end

puts (0...10).map { |i| motzkin(i) }.join(" ")
