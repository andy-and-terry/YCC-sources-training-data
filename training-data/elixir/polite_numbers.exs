# Ways to write n as a sum of two or more consecutive positive integers.
polite_ways = fn n ->
  2..n//1
  |> Enum.take_while(fn k -> div(k * (k + 1), 2) <= n end)
  |> Enum.count(fn k -> rem(n - div(k * (k - 1), 2), k) == 0 end)
end

IO.puts(1..16 |> Enum.map(polite_ways) |> Enum.join(" "))
