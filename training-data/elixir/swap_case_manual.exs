swap_case = fn s ->
  s
  |> String.graphemes()
  |> Enum.map(fn c -> if c == String.upcase(c), do: String.downcase(c), else: String.upcase(c) end)
  |> Enum.join()
end

IO.puts(swap_case.("Hello World 42"))
