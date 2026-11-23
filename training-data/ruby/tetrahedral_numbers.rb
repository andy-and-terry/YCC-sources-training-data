# n(n+1)(n+2)/6
def term(n)
  ((n * (n + 1)) * (n + 2)) / 6
end

(1..15).each do |n|
  puts format("%2d -> %d", n, term(n))
end
