# n(n+1)/2+1
defmodule LazyCatererSequence do
  def term(n), do: div((n * (n + 1)), 2) + 1
end

for n <- 1..15 do
  IO.puts("#{n} -> #{LazyCatererSequence.term(n)}")
end
