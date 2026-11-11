# Tetrahedral numbers n(n+1)(n+2)/6
defmodule TetrahedralNumbers do
  def term(n), do: div(((n * (n + 1)) * (n + 2)), 6)
end

IO.puts(Enum.map_join(0..9, " ", &TetrahedralNumbers.term/1))
