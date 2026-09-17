defmodule FenwickTree do
  import Bitwise

  defstruct tree: %{}, size: 0

  def new(size) do
    tree = for i <- 1..size, into: %{}, do: {i, 0}
    %__MODULE__{tree: tree, size: size}
  end

  def add(%__MODULE__{} = ft, index, delta) do
    tree = do_add(ft.tree, index + 1, ft.size, delta)
    %{ft | tree: tree}
  end

  defp do_add(tree, i, size, _delta) when i > size, do: tree

  defp do_add(tree, i, size, delta) do
    tree = Map.update(tree, i, delta, &(&1 + delta))
    do_add(tree, i + (i &&& -i), size, delta)
  end

  def prefix_sum(%__MODULE__{} = ft, index), do: do_sum(ft.tree, index + 1, 0)

  defp do_sum(_tree, i, total) when i <= 0, do: total

  defp do_sum(tree, i, total) do
    do_sum(tree, i - (i &&& -i), total + Map.get(tree, i, 0))
  end

  def range_sum(ft, left, right) do
    prefix_sum(ft, right) - if(left > 0, do: prefix_sum(ft, left - 1), else: 0)
  end
end

ft = FenwickTree.new(6)

ft =
  [1, 3, 5, 7, 9, 11]
  |> Enum.with_index()
  |> Enum.reduce(ft, fn {v, i}, acc -> FenwickTree.add(acc, i, v) end)

IO.inspect(FenwickTree.range_sum(ft, 1, 3))
IO.inspect(FenwickTree.prefix_sum(ft, 5))
