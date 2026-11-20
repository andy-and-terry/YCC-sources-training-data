# Lattice paths via a reduce over DP rows.
defmodule Lattice do
  def paths(n) do
    row = List.duplicate(1, n + 1)
    Enum.reduce(1..n, row, fn _, r -> Enum.scan(r, &(&1 + &2)) end) |> List.last()
  end
end

IO.inspect(Lattice.paths(3))
