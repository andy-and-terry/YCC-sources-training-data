# n(2n^2+1)/3
def term(n)
  (n * (((2 * n) * n) + 1)) / 3
end

(1..15).each do |n|
  puts format("%2d -> %d", n, term(n))
end
