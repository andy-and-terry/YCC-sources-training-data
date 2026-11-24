# Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
1..8
|> Enum.scan(0, fn _, r -> r * 10 + 1 end)
|> Enum.each(fn r ->
  IO.puts("#{r}#{if rem(r, 3) == 0, do: "  (divisible by 3)", else: ""}")
end)
