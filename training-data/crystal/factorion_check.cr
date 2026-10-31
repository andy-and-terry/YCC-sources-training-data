FACT = [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880]

def factorion?(n : Int32) : Bool
  n == n.digits.sum { |d| FACT[d] }
end

puts (1...50_000).select { |n| factorion?(n) }.inspect
