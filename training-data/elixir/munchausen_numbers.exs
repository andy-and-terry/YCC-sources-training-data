# Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
munchausen? = fn n ->
  n
  |> Integer.digits()
  |> Enum.map(fn d -> if d == 0, do: 0, else: Integer.pow(d, d) end)
  |> Enum.sum() == n
end

1..4999 |> Enum.filter(munchausen?) |> Enum.join(" ") |> IO.puts()
