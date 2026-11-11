# Centered square numbers 2n(n+1)+1
defmodule CenteredSquareNumbers do
  def term(n), do: ((2 * n) * (n + 1)) + 1
end

IO.puts(Enum.map_join(0..9, " ", &CenteredSquareNumbers.term/1))
