chebyshev = fn a, b -> Enum.zip(a, b) |> Enum.map(fn {x, y} -> abs(x - y) end) |> Enum.max() end

IO.puts(chebyshev.([1, 2], [4, 6]))
