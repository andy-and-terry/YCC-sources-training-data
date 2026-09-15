defmodule Islands do
  def count(grid) do
    rows = length(grid)
    cols = length(List.first(grid))

    grid_map =
      for {row, r} <- Enum.with_index(grid),
          {cell, c} <- Enum.with_index(row),
          into: %{},
          do: {{r, c}, cell}

    {count, _visited} =
      Enum.reduce(0..(rows - 1), {0, MapSet.new()}, fn r, {count_acc, visited_acc} ->
        Enum.reduce(0..(cols - 1), {count_acc, visited_acc}, fn c, {inner_count, inner_visited} ->
          if Map.get(grid_map, {r, c}) == 1 and not MapSet.member?(inner_visited, {r, c}) do
            new_visited = flood(grid_map, {r, c}, inner_visited)
            {inner_count + 1, new_visited}
          else
            {inner_count, inner_visited}
          end
        end)
      end)

    count
  end

  defp flood(grid_map, {r, c}, visited) do
    cond do
      MapSet.member?(visited, {r, c}) -> visited
      Map.get(grid_map, {r, c}, 0) == 0 -> visited
      true ->
        visited = MapSet.put(visited, {r, c})

        [{r + 1, c}, {r - 1, c}, {r, c + 1}, {r, c - 1}]
        |> Enum.reduce(visited, fn neighbor, acc -> flood(grid_map, neighbor, acc) end)
    end
  end
end

grid = [
  [1, 1, 0, 0, 0],
  [1, 1, 0, 0, 0],
  [0, 0, 1, 0, 0],
  [0, 0, 0, 1, 1]
]

IO.inspect(Islands.count(grid))
