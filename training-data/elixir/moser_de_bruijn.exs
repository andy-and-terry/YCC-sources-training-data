# Moser-de Bruijn sequence: binary digits of n read in base 4.
0..11
|> Enum.map(fn n -> n |> Integer.to_string(2) |> String.to_integer(4) end)
|> Enum.join(" ")
|> IO.puts()
