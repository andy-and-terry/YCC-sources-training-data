# Munchausen numbers: sum of digit**digit equals n (0**0 counted as 0).
def munchausen?(n : Int32) : Bool
  n.digits.sum { |d| d == 0 ? 0 : d ** d } == n
end

puts (1...5000).select { |n| munchausen?(n) }.join(" ")
