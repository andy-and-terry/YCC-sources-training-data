defmodule BreadthFirstSearch do
  def traverse(graph, start) do
    bfs(graph, :queue.in(start, :queue.new()), MapSet.new([start]), [])
  end

  defp bfs(graph, queue, visited, order) do
    case :queue.out(queue) do
      {:empty, _} ->
        Enum.reverse(order)

      {{:value, node}, rest} ->
        neighbors = Map.get(graph, node, [])

        {new_queue, new_visited} =
          Enum.reduce(neighbors, {rest, visited}, fn neighbor, {q, seen} ->
            if MapSet.member?(seen, neighbor) do
              {q, seen}
            else
              {:queue.in(neighbor, q), MapSet.put(seen, neighbor)}
            end
          end)

        bfs(graph, new_queue, new_visited, [node | order])
    end
  end
end

graph = %{a: [:b, :c], b: [:d], c: [:d], d: []}
IO.inspect(BreadthFirstSearch.traverse(graph, :a))
