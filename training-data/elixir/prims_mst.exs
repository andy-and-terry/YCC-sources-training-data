defmodule PrimsMST do
  def minimum_spanning_tree(graph, start) do
    visited = MapSet.new([start])
    edges = graph |> Map.get(start, []) |> Enum.map(fn {to, w} -> {start, to, w} end)
    build(graph, visited, edges, [])
  end

  defp build(_graph, _visited, [], acc), do: Enum.reverse(acc)

  defp build(graph, visited, candidate_edges, acc) do
    available = Enum.reject(candidate_edges, fn {_from, to, _w} -> MapSet.member?(visited, to) end)

    case Enum.min_by(available, fn {_from, _to, w} -> w end, fn -> nil end) do
      nil ->
        Enum.reverse(acc)

      {_from, to, _w} = edge ->
        visited = MapSet.put(visited, to)

        new_edges =
          graph
          |> Map.get(to, [])
          |> Enum.map(fn {neighbor, w} -> {to, neighbor, w} end)

        remaining = Enum.reject(candidate_edges, fn {_f, t, _w} -> t == to end)
        build(graph, visited, remaining ++ new_edges, [edge | acc])
    end
  end
end

graph = %{
  a: [{:b, 1}, {:c, 4}],
  b: [{:a, 1}, {:c, 2}, {:d, 5}],
  c: [{:a, 4}, {:b, 2}, {:d, 1}],
  d: [{:b, 5}, {:c, 1}]
}

IO.inspect(PrimsMST.minimum_spanning_tree(graph, :a))
