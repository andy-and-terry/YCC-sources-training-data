# n(2n^2+1)/3
defmodule OctahedralNumbers do
  def term(n), do: div((n * (((2 * n) * n) + 1)), 3)
end

for n <- 1..15 do
  IO.puts("#{n} -> #{OctahedralNumbers.term(n)}")
end
