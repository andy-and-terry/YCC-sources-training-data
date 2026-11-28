def sigma(n)
  (1..n).select { |d| (n % d).zero? }.sum
end

p (1..20).select { |n| sigma(n) < 2 * n }
