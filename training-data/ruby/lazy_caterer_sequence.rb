# n(n+1)/2+1
def term(n)
  ((n * (n + 1)) / 2) + 1
end

(1..15).each do |n|
  puts format("%2d -> %d", n, term(n))
end
