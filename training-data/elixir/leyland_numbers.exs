# Leyland numbers: x^y + y^x for x >= y >= 2.
ipow = fn b, e -> Enum.reduce(1..e, 1, fn _, acc -> acc * b end) end

vals = for x <- 2..4, y <- 2..x, do: ipow.(x, y) + ipow.(y, x)
IO.puts(Enum.join(vals, " "))
