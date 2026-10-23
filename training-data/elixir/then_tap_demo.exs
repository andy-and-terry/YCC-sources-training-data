# then/2 continues a pipeline with a custom function; tap/2 runs a side effect.
result =
  [3, 1, 2]
  |> Enum.sort()
  |> tap(fn sorted -> IO.inspect(sorted, label: "sorted") end)
  |> Enum.map(&(&1 * 10))
  |> then(fn list -> {length(list), Enum.sum(list)} end)

IO.inspect(result)

# then is handy when the piped value is not the first argument.
"hello"
|> String.upcase()
|> then(&String.pad_leading(&1, 8, "*"))
|> IO.puts()

5
|> then(&Enum.map(1..&1, fn n -> n * n end))
|> IO.inspect()
