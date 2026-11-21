# Disarium numbers: digits raised to their 1-based positions sum to n.
disarium? = fn n ->
  n
  |> Integer.digits()
  |> Enum.with_index(1)
  |> Enum.map(fn {d, i} -> Integer.pow(d, i) end)
  |> Enum.sum() == n
end

1..999 |> Enum.filter(disarium?) |> Enum.join(" ") |> IO.puts()
