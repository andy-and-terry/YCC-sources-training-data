defmodule DepthFirstSearch do
  def traverse(graph, start) do
    {order, _visited} = dfs(graph, start, MapSet.new(), [])
    Enum.reverse(order)
  end

  defp dfs(graph, node, visited, order) do
    if MapSet.member?(visited, node) do
      {order, visited}
    else
      visited = MapSet.put(visited, node)
      order = [node | order]

      neighbors = Map.get(graph, node, [])

      Enum.reduce(neighbors, {order, visited}, fn neighbor, {acc_order, acc_visited} ->
        dfs(graph, neighbor, acc_visited, acc_order)
      end)
    end
  end
end

graph = %{a: [:b, :c], b: [:d], c: [:d], d: []}
IO.inspect(DepthFirstSearch.traverse(graph, :a))
