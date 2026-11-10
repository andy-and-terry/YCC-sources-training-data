tau = fn n -> Enum.count(1..n, &(rem(n, &1) == 0)) end
IO.puts(1..59 |> Enum.filter(&(rem(&1, tau.(&1)) == 0)) |> Enum.join(" ")) # 1 2 8 9 12 18 24 36 40 56
