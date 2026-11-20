# Remove consecutive duplicates.
IO.puts("aabbbcdd" |> String.graphemes() |> Enum.dedup() |> Enum.join())
