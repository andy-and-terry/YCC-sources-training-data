defmodule FloodFill do
  def fill(grid, {r, c}, color) do
    original = Map.fetch!(grid, {r, c})
    if original == color, do: grid, else: do_fill(grid, [{r, c}], original, color)
  end

  defp do_fill(grid, [], _original, _color), do: grid

  defp do_fill(grid, [{r, c} | rest], original, color) do
    if Map.get(grid, {r, c}) == original do
      grid = Map.put(grid, {r, c}, color)
      neighbors = [{r + 1, c}, {r - 1, c}, {r, c + 1}, {r, c - 1}]
      do_fill(grid, neighbors ++ rest, original, color)
    else
      do_fill(grid, rest, original, color)
    end
  end
end

rows = [[1, 1, 0], [1, 0, 0], [1, 1, 1]]

grid =
  for {row, r} <- Enum.with_index(rows),
      {v, c} <- Enum.with_index(row),
      into: %{},
      do: {{r, c}, v}

filled = FloodFill.fill(grid, {0, 0}, 7)

for r <- 0..2 do
  IO.puts(Enum.map_join(0..2, " ", fn c -> filled[{r, c}] end))
end
