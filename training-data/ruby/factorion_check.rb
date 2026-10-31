FACT = (0..9).map { |d| (1..d).reduce(1, :*) }

def factorion?(n)
  n == n.digits.sum { |d| FACT[d] }
end

p (1...50_000).select { |n| factorion?(n) }
