# Read the binary digits of i as base-4 digits.
moser = fn
  0 -> 0
  i -> i |> Integer.to_string(2) |> String.to_integer(4)
end

IO.puts(Enum.map_join(0..9, " ", moser)) # 0 1 4 5 16 17 20 21 64 65
