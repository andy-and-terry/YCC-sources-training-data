# n is triangular iff 8n + 1 is a perfect square.
def triangular?(n : Int32) : Bool
  s = 8 * n + 1
  r = Math.sqrt(s).round.to_i
  r * r == s
end

puts (0..20).select { |n| triangular?(n) }.join(" ")
