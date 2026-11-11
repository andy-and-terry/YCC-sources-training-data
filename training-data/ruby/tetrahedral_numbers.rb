# Tetrahedral numbers n(n+1)(n+2)/6
def term(n)
  ((n * (n + 1)) * (n + 2))/6
end

puts (0..9).map { |n| term(n) }.join(" ")
