# 6n(n-1)+1
def term(n)
  ((6 * n) * (n - 1)) + 1
end

(1..15).each do |n|
  puts format("%2d -> %d", n, term(n))
end
