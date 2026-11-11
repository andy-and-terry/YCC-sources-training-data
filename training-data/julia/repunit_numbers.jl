# Repunits: numbers made only of the digit 1.
repunits(count) = accumulate((r, _) -> r * 10 + 1, 1:count; init = 0)

println(repunits(5))
