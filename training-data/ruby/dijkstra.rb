def dijkstra(graph, source)
  dist = graph.keys.to_h { |node| [node, Float::INFINITY] }
  dist[source] = 0
  visited = {}

  graph.size.times do
    current = dist.reject { |node, _| visited[node] }.min_by { |_, d| d }
    break unless current

    node, node_dist = current
    visited[node] = true

    graph[node].each do |neighbor, weight|
      new_dist = node_dist + weight
      dist[neighbor] = new_dist if new_dist < dist[neighbor]
    end
  end

  dist
end

graph = {
  'a' => { 'b' => 1, 'c' => 4 },
  'b' => { 'c' => 2, 'd' => 5 },
  'c' => { 'd' => 1 },
  'd' => {}
}

puts dijkstra(graph, 'a').inspect
