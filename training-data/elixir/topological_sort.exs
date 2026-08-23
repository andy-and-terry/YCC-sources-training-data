defmodule TopoSort do
  def sort(graph) do
    nodes = Map.keys(graph)
    visit_all(nodes, graph, MapSet.new(), [])
  end

  defp visit_all([], _graph, _visited, order), do: order

  defp visit_all([node | rest], graph, visited, order) do
    {visited, order} = visit(node, graph, visited, order)
    visit_all(rest, graph, visited, order)
  end

  defp visit(node, graph, visited, order) do
    if MapSet.member?(visited, node) do
      {visited, order}
    else
      visited = MapSet.put(visited, node)
      deps = Map.get(graph, node, [])
      {visited, order} = visit_all(deps, graph, visited, order)
      {visited, [node | order]}
    end
  end
end

graph = %{a: [:b, :c], b: [:d], c: [:d], d: []}
IO.inspect(TopoSort.sort(graph))
