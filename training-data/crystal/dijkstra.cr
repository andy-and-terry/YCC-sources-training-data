def dijkstra(graph : Hash(Int32, Array(Tuple(Int32, Int32))), source : Int32, node_count : Int32) : Array(Int32)
  dist = Array.new(node_count, Int32::MAX)
  dist[source] = 0
  visited = Array.new(node_count, false)

  node_count.times do
    u = -1
    best = Int32::MAX
    node_count.times do |i|
      if !visited[i] && dist[i] < best
        best = dist[i]
        u = i
      end
    end
    break if u == -1

    visited[u] = true
    if edges = graph[u]?
      edges.each do |v, weight|
        if dist[u] + weight < dist[v]
          dist[v] = dist[u] + weight
        end
      end
    end
  end

  dist
end

graph = {
  0 => [{1, 4}, {2, 1}],
  1 => [{3, 1}],
  2 => [{1, 2}, {3, 5}],
  3 => [] of Tuple(Int32, Int32),
}

puts dijkstra(graph, 0, 4).inspect
