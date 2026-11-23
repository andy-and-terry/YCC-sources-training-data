# n(n+1)(2n+1)/6
def term(n)
  ((n * (n + 1)) * ((2 * n) + 1)) / 6
end

(1..15).each do |n|
  puts format("%2d -> %d", n, term(n))
end
