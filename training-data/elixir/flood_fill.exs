defmodule FloodFill do
  def fill(grid, row, col, new_color) do
    old_color = grid |> Enum.at(row) |> Enum.at(col)
    if old_color == new_color, do: grid, else: do_fill(grid, row, col, old_color, new_color)
  end

  defp do_fill(grid, row, col, old_color, new_color) do
    rows = length(grid)
    cols = length(Enum.at(grid, 0))

    if row < 0 or row >= rows or col < 0 or col >= cols do
      grid
    else
      current = grid |> Enum.at(row) |> Enum.at(col)

      if current != old_color do
        grid
      else
        grid = update_cell(grid, row, col, new_color)

        grid
        |> do_fill(row + 1, col, old_color, new_color)
        |> do_fill(row - 1, col, old_color, new_color)
        |> do_fill(row, col + 1, old_color, new_color)
        |> do_fill(row, col - 1, old_color, new_color)
      end
    end
  end

  defp update_cell(grid, row, col, value) do
    List.update_at(grid, row, fn r -> List.update_at(r, col, fn _ -> value end) end)
  end
end

grid = [
  [1, 1, 1],
  [1, 1, 0],
  [1, 0, 1]
]

IO.inspect(FloodFill.fill(grid, 1, 1, 2))
