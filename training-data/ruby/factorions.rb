FACT = (0..9).map { |d| (1..d).reduce(1, :*) }

p (1...50_000).select { |n| n.digits.sum { |d| FACT[d] } == n } # [1, 2, 145, 40585]
