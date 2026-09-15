defmodule FenwickTree do
  import Bitwise

  def new(size), do: %{size: size, tree: Map.new(1..size, fn i -> {i, 0} end)}

  def add(%{size: size, tree: tree}, index, delta) do
    updated =
      Stream.iterate(index + 1, &(&1 + (&1 &&& -&1)))
      |> Enum.take_while(&(&1 <= size))
      |> Enum.reduce(tree, fn i, acc -> Map.update!(acc, i, &(&1 + delta)) end)

    %{size: size, tree: updated}
  end

  def prefix_sum(%{tree: tree}, index) do
    Stream.iterate(index + 1, &(&1 - (&1 &&& -&1)))
    |> Enum.take_while(&(&1 > 0))
    |> Enum.reduce(0, fn i, acc -> acc + Map.get(tree, i, 0) end)
  end

  def range_sum(fenwick, left, right) do
    if left > 0 do
      prefix_sum(fenwick, right) - prefix_sum(fenwick, left - 1)
    else
      prefix_sum(fenwick, right)
    end
  end
end

values = [1, 3, 5, 7, 9, 11]

fenwick =
  values
  |> Enum.with_index(1)
  |> Enum.reduce(FenwickTree.new(length(values)), fn {v, i}, acc ->
    FenwickTree.add(acc, i - 1, v)
  end)

IO.inspect(FenwickTree.range_sum(fenwick, 1, 3))
fenwick = FenwickTree.add(fenwick, 1, 10)
IO.inspect(FenwickTree.range_sum(fenwick, 1, 3))
