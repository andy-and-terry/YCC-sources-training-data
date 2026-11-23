# 6n(n-1)+1
defmodule StarNumbers do
  def term(n), do: ((6 * n) * (n - 1)) + 1
end

for n <- 1..15 do
  IO.puts("#{n} -> #{StarNumbers.term(n)}")
end
