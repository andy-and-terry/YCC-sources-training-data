defmodule FenwickTree do
  defstruct size: 0, tree: %{}

  def new(size) do
    %FenwickTree{size: size, tree: Map.new(1..size, fn i -> {i, 0} end)}
  end

  def update(%FenwickTree{size: size, tree: tree} = fenwick, index, delta) do
    tree = do_update(tree, index, delta, size)
    %{fenwick | tree: tree}
  end

  defp do_update(tree, index, _delta, size) when index > size, do: tree

  defp do_update(tree, index, delta, size) do
    tree = Map.update!(tree, index, &(&1 + delta))
    do_update(tree, index + Bitwise.band(index, -index), delta, size)
  end

  def prefix_sum(%FenwickTree{tree: tree}, index) do
    do_prefix_sum(tree, index, 0)
  end

  defp do_prefix_sum(_tree, index, sum) when index <= 0, do: sum

  defp do_prefix_sum(tree, index, sum) do
    do_prefix_sum(tree, index - Bitwise.band(index, -index), sum + Map.get(tree, index, 0))
  end

  def range_sum(fenwick, lo, hi) do
    prefix_sum(fenwick, hi) - prefix_sum(fenwick, lo - 1)
  end
end

fenwick =
  Enum.reduce(Enum.with_index([3, 2, -1, 6, 5, 4, -3, 3, 7, 2], 1), FenwickTree.new(10), fn
    {value, index}, acc -> FenwickTree.update(acc, index, value)
  end)

IO.inspect(FenwickTree.prefix_sum(fenwick, 5))
IO.inspect(FenwickTree.range_sum(fenwick, 3, 7))
