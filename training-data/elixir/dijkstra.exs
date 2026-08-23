defmodule Dijkstra do
  def shortest_paths(graph, source) do
    nodes = Map.keys(graph)
    dist = Map.new(nodes, fn n -> {n, :infinity} end) |> Map.put(source, 0)
    visit(MapSet.new(), dist, graph)
  end

  defp visit(visited, dist, graph) do
    unvisited = Map.drop(dist, MapSet.to_list(visited))

    candidate =
      unvisited
      |> Enum.reject(fn {_k, v} -> v == :infinity end)
      |> Enum.min_by(fn {_k, v} -> v end, fn -> nil end)

    case candidate do
      nil ->
        dist

      {node, node_dist} ->
        visited = MapSet.put(visited, node)

        dist =
          Enum.reduce(Map.get(graph, node, []), dist, fn {neighbor, weight}, acc ->
            new_dist = node_dist + weight

            if new_dist < Map.get(acc, neighbor, :infinity) do
              Map.put(acc, neighbor, new_dist)
            else
              acc
            end
          end)

        visit(visited, dist, graph)
    end
  end
end

graph = %{
  a: [{:b, 1}, {:c, 4}],
  b: [{:c, 2}, {:d, 5}],
  c: [{:d, 1}],
  d: []
}

IO.inspect(Dijkstra.shortest_paths(graph, :a))
