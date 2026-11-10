sigma = fn n -> 1..n |> Enum.filter(&(rem(n, &1) == 0)) |> Enum.sum() end
IO.puts(1..99 |> Enum.filter(&(sigma.(sigma.(&1)) == 2 * &1)) |> Enum.join(" ")) # 2 4 16 64
