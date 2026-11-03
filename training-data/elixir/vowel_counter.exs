counts =
  "Education is beautiful"
  |> String.downcase()
  |> String.graphemes()
  |> Enum.filter(&(&1 in ~w(a e i o u)))
  |> Enum.frequencies()

IO.inspect(counts)
