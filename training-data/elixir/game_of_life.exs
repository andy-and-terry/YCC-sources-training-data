defmodule Life do
  @moduledoc "Game of Life on an unbounded grid, using a MapSet of live cells."

  def step(alive) do
    counts =
      for {r, c} <- alive, dr <- -1..1, dc <- -1..1, {dr, dc} != {0, 0}, reduce: %{} do
        acc -> Map.update(acc, {r + dr, c + dc}, 1, &(&1 + 1))
      end

    for {cell, n} <- counts,
        n == 3 or (n == 2 and MapSet.member?(alive, cell)),
        into: MapSet.new(),
        do: cell
  end

  def render(alive, rows, cols) do
    for r <- 0..(rows - 1) do
      for c <- 0..(cols - 1), into: "" do
        if MapSet.member?(alive, {r, c}), do: "#", else: "."
      end
    end
    |> Enum.join("\n")
  end
end

glider = MapSet.new([{0, 1}, {1, 2}, {2, 0}, {2, 1}, {2, 2}])

Enum.reduce(0..3, glider, fn gen, alive ->
  IO.puts("Generation #{gen}:")
  IO.puts(Life.render(alive, 5, 5))
  Life.step(alive)
end)
