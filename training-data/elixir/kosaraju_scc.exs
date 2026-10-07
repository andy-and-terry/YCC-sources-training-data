defmodule KosarajuScc do
  def strongly_connected(graph) do
    nodes = Map.keys(graph)
    {_visited, finish_order} = dfs_all(nodes, graph, MapSet.new(), [])
    transposed = transpose(graph)

    finish_order
    |> Enum.reduce({MapSet.new(), []}, fn node, {visited, components} ->
      if MapSet.member?(visited, node) do
        {visited, components}
      else
        {visited, component} = collect(node, transposed, visited, [])
        {visited, [component | components]}
      end
    end)
    |> elem(1)
  end

  defp dfs_all([], _graph, visited, order), do: {visited, order}

  defp dfs_all([node | rest], graph, visited, order) do
    {visited, order} = dfs(node, graph, visited, order)
    dfs_all(rest, graph, visited, order)
  end

  defp dfs(node, graph, visited, order) do
    if MapSet.member?(visited, node) do
      {visited, order}
    else
      visited = MapSet.put(visited, node)
      {visited, order} = dfs_all(Map.get(graph, node, []), graph, visited, order)
      {visited, [node | order]}
    end
  end

  defp collect(node, graph, visited, acc) do
    if MapSet.member?(visited, node) do
      {visited, acc}
    else
      visited = MapSet.put(visited, node)
      acc = [node | acc]

      Enum.reduce(Map.get(graph, node, []), {visited, acc}, fn neighbor, {v, a} ->
        collect(neighbor, graph, v, a)
      end)
    end
  end

  defp transpose(graph) do
    Enum.reduce(graph, %{}, fn {node, neighbors}, acc ->
      acc = Map.put_new(acc, node, [])

      Enum.reduce(neighbors, acc, fn neighbor, inner ->
        Map.update(inner, neighbor, [node], &[node | &1])
      end)
    end)
  end
end

# Two cycles: a -> b -> c -> a, and d -> e -> d, with a bridge c -> d.
graph = %{
  a: [:b],
  b: [:c],
  c: [:a, :d],
  d: [:e],
  e: [:d]
}

IO.inspect(KosarajuScc.strongly_connected(graph))
