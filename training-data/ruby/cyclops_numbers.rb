# Cyclops numbers: odd digit count, middle digit zero, no other zeros.
# Count those in 1..99999 (expected 6642).
def cyclops?(n)
  s = n.to_s
  s.length.odd? && s[s.length / 2] == "0" && s.count("0") == 1
end

puts (1...100_000).count { |n| cyclops?(n) }
