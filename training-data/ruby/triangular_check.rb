# n is triangular iff 8n + 1 is a perfect square.
def triangular?(n)
  s = 8 * n + 1
  Integer.sqrt(s)**2 == s
end

puts (0..20).select { |n| triangular?(n) }.join(" ")
