# Square pyramidal numbers n(n+1)(2n+1)/6
defmodule SquarePyramidalNumbers do
  def term(n), do: div(((n * (n + 1)) * ((2 * n) + 1)), 6)
end

IO.puts(Enum.map_join(0..9, " ", &SquarePyramidalNumbers.term/1))
