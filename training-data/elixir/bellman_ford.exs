defmodule BellmanFord do
  def shortest_paths(edges, node_count, source) do
    dist = for n <- 0..(node_count - 1), into: %{}, do: {n, :infinity}
    dist = Map.put(dist, source, 0)

    dist = Enum.reduce(1..(node_count - 1), dist, fn _, acc -> relax_all(edges, acc) end)

    case has_negative_cycle?(edges, dist) do
      true -> {:error, :negative_cycle}
      false -> {:ok, dist}
    end
  end

  defp relax_all(edges, dist) do
    Enum.reduce(edges, dist, fn {from, to, weight}, acc ->
      relax(acc, from, to, weight)
    end)
  end

  defp relax(dist, from, to, weight) do
    case Map.get(dist, from) do
      :infinity ->
        dist

      from_dist ->
        candidate = from_dist + weight

        if candidate < Map.get(dist, to, :infinity) do
          Map.put(dist, to, candidate)
        else
          dist
        end
    end
  end

  defp has_negative_cycle?(edges, dist) do
    Enum.any?(edges, fn {from, to, weight} ->
      case Map.get(dist, from) do
        :infinity -> false
        from_dist -> from_dist + weight < Map.get(dist, to, :infinity)
      end
    end)
  end
end

edges = [{0, 1, 4}, {0, 2, 5}, {1, 2, -3}, {2, 3, 4}]
IO.inspect(BellmanFord.shortest_paths(edges, 4, 0))
