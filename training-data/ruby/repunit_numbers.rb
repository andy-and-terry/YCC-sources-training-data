# Repunits: R_k = (10**k - 1) / 9, built as r = 10r + 1.
r = 0
puts Array.new(8) { r = r * 10 + 1 }.join(" ")
