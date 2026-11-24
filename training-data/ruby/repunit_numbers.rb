# Repunits: R_n = (10^n - 1) / 9 = 11...1.
repunits = (1..8).map { |n| (10**n - 1) / 9 }
puts repunits.join(" ")
puts repunits.select { |r| (r % 3).zero? }.inspect
