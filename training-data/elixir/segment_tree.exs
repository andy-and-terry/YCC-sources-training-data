defmodule SegmentTree do
  defstruct tree: %{}, n: 0

  def build(data) do
    n = length(data)
    do_build(%__MODULE__{tree: %{}, n: n}, 1, 0, n - 1, List.to_tuple(data))
  end

  defp do_build(seg, node, start_i, end_i, data) when start_i == end_i do
    %{seg | tree: Map.put(seg.tree, node, elem(data, start_i))}
  end

  defp do_build(seg, node, start_i, end_i, data) do
    mid = div(start_i + end_i, 2)
    seg = do_build(seg, 2 * node, start_i, mid, data)
    seg = do_build(seg, 2 * node + 1, mid + 1, end_i, data)
    value = Map.get(seg.tree, 2 * node) + Map.get(seg.tree, 2 * node + 1)
    %{seg | tree: Map.put(seg.tree, node, value)}
  end

  def query(seg, left, right), do: do_query(seg, 1, 0, seg.n - 1, left, right)

  defp do_query(_seg, _node, start_i, end_i, left, right) when right < start_i or end_i < left,
    do: 0

  defp do_query(seg, node, start_i, end_i, left, right)
       when left <= start_i and end_i <= right do
    Map.get(seg.tree, node)
  end

  defp do_query(seg, node, start_i, end_i, left, right) do
    mid = div(start_i + end_i, 2)
    do_query(seg, 2 * node, start_i, mid, left, right) +
      do_query(seg, 2 * node + 1, mid + 1, end_i, left, right)
  end
end

seg = SegmentTree.build([1, 3, 5, 7, 9, 11])
IO.inspect(SegmentTree.query(seg, 1, 3))
