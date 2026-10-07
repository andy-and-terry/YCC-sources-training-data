defmodule CycleDetection do
  def has_cycle?(graph, nodes) do
    Enum.reduce_while(nodes, %{}, fn node, color ->
      case Map.get(color, node) do
        nil ->
          case dfs(node, graph, color) do
            {:cycle, _c} -> {:halt, :cycle}
            {:ok, updated_color} -> {:cont, updated_color}
          end

        _visited ->
          {:cont, color}
      end
    end)
    |> case do
      :cycle -> true
      _color -> false
    end
  end

  defp dfs(node, graph, color) do
    color = Map.put(color, node, :gray)
    neighbors = Map.get(graph, node, [])

    Enum.reduce_while(neighbors, {:ok, color}, fn
      neighbor, {:ok, c} ->
        case Map.get(c, neighbor) do
          :gray ->
            {:halt, {:cycle, c}}

          :black ->
            {:cont, {:ok, c}}

          nil ->
            case dfs(neighbor, graph, c) do
              {:cycle, updated} -> {:halt, {:cycle, updated}}
              {:ok, updated} -> {:cont, {:ok, updated}}
            end
        end
    end)
    |> case do
      {:cycle, c} -> {:cycle, c}
      {:ok, c} -> {:ok, Map.put(c, node, :black)}
    end
  end
end

acyclic = %{0 => [1], 1 => [2], 2 => []}
cyclic = %{0 => [1], 1 => [2], 2 => [0]}

IO.inspect(CycleDetection.has_cycle?(acyclic, [0, 1, 2]))
IO.inspect(CycleDetection.has_cycle?(cyclic, [0, 1, 2]))
