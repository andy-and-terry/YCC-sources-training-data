# Munchausen numbers: sum of digit**digit equals n (0**0 counted as 0).
def munchausen?(n)
  n.digits.sum { |d| d.zero? ? 0 : d**d } == n
end

puts (1...5000).select { |n| munchausen?(n) }.join(" ")
