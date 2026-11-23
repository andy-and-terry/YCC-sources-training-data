# n(n+1)(n+2)/6
defmodule TetrahedralNumbers do
  def term(n), do: div(((n * (n + 1)) * (n + 2)), 6)
end

for n <- 1..15 do
  IO.puts("#{n} -> #{TetrahedralNumbers.term(n)}")
end
