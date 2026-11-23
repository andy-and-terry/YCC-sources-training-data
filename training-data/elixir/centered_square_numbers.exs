# 2n(n-1)+1
defmodule CenteredSquareNumbers do
  def term(n), do: ((2 * n) * (n - 1)) + 1
end

for n <- 1..15 do
  IO.puts("#{n} -> #{CenteredSquareNumbers.term(n)}")
end
