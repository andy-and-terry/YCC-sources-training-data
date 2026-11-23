# 3n(n-1)+1
defmodule CenteredHexagonalNumbers do
  def term(n), do: ((3 * n) * (n - 1)) + 1
end

for n <- 1..15 do
  IO.puts("#{n} -> #{CenteredHexagonalNumbers.term(n)}")
end
