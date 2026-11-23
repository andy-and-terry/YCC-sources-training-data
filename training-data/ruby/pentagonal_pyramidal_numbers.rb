# n^2(n+1)/2
def term(n)
  ((n * n) * (n + 1)) / 2
end

(1..15).each do |n|
  puts format("%2d -> %d", n, term(n))
end
