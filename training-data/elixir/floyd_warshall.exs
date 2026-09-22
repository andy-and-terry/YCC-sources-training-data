defmodule FloydWarshall do
  def shortest_paths(dist, node_count) do
    nodes = 0..(node_count - 1)

    Enum.reduce(nodes, dist, fn k, acc ->
      Enum.reduce(nodes, acc, fn i, acc2 ->
        Enum.reduce(nodes, acc2, fn j, acc3 ->
          via_k = get(acc3, i, k) + get(acc3, k, j)

          if via_k < get(acc3, i, j) do
            Map.put(acc3, {i, j}, via_k)
          else
            acc3
          end
        end)
      end)
    end)
  end

  defp get(dist, i, j), do: Map.get(dist, {i, j}, :infinity_placeholder) |> normalize()

  defp normalize(:infinity_placeholder), do: 1_000_000
  defp normalize(v), do: v
end

initial = %{
  {0, 0} => 0,
  {0, 1} => 3,
  {0, 2} => 1_000_000,
  {1, 0} => 1_000_000,
  {1, 1} => 0,
  {1, 2} => 1,
  {2, 0} => 1_000_000,
  {2, 1} => 1_000_000,
  {2, 2} => 0
}

result = FloydWarshall.shortest_paths(initial, 3)
IO.inspect(result[{0, 2}])
