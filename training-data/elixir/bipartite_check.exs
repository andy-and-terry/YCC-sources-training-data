defmodule BipartiteCheck do
  def bipartite?(graph) do
    check_all(Map.keys(graph), graph, %{})
  end

  defp check_all([], _graph, _color), do: true

  defp check_all([node | rest], graph, color) do
    if Map.has_key?(color, node) do
      check_all(rest, graph, color)
    else
      case bfs([node], graph, Map.put(color, node, 0)) do
        {:ok, updated_color} -> check_all(rest, graph, updated_color)
        :conflict -> false
      end
    end
  end

  defp bfs([], _graph, color), do: {:ok, color}

  defp bfs([node | queue], graph, color) do
    neighbors = Map.get(graph, node, [])
    node_color = Map.fetch!(color, node)

    Enum.reduce(neighbors, {:ok, color, []}, fn
      _neighbor, {:conflict, c, q} ->
        {:conflict, c, q}

      neighbor, {:ok, c, q} ->
        case Map.get(c, neighbor) do
          nil -> {:ok, Map.put(c, neighbor, 1 - node_color), [neighbor | q]}
          ^node_color -> {:conflict, c, q}
          _different -> {:ok, c, q}
        end
    end)
    |> case do
      {:conflict, _c, _q} -> :conflict
      {:ok, updated_color, new_nodes} -> bfs(queue ++ new_nodes, graph, updated_color)
    end
  end
end

bipartite = %{0 => [1, 3], 1 => [0, 2], 2 => [1, 3], 3 => [0, 2]}
not_bipartite = %{0 => [1, 2], 1 => [0, 2], 2 => [0, 1]}

IO.inspect(BipartiteCheck.bipartite?(bipartite))
IO.inspect(BipartiteCheck.bipartite?(not_bipartite))
