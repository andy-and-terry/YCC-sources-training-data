# n(n+1)(n+2)(n+3)/24
defmodule PentatopeNumbers do
  def term(n), do: div((((n * (n + 1)) * (n + 2)) * (n + 3)), 24)
end

for n <- 1..15 do
  IO.puts("#{n} -> #{PentatopeNumbers.term(n)}")
end
