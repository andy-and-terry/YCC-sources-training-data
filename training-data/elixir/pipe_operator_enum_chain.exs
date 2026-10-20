result =
  1..20
  |> Enum.filter(&(rem(&1, 3) == 0))
  |> Enum.map(&(&1 * &1))
  |> Enum.reduce(0, &+/2)

IO.puts(result)

"the quick brown fox"
|> String.split()
|> Enum.map(&String.capitalize/1)
|> Enum.join(" ")
|> IO.puts()

[3, 1, 2] |> Enum.sort(:desc) |> Enum.take(2) |> IO.inspect()
%{a: 1} |> Map.put(:b, 2) |> Map.update!(:a, &(&1 + 10)) |> IO.inspect()
