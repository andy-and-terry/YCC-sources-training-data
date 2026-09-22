def bellman_ford(edges, num_vertices, source)
  distances = Array.new(num_vertices, Float::INFINITY)
  distances[source] = 0

  (num_vertices - 1).times do
    edges.each do |u, v, weight|
      if distances[u] != Float::INFINITY && distances[u] + weight < distances[v]
        distances[v] = distances[u] + weight
      end
    end
  end

  edges.each do |u, v, weight|
    if distances[u] != Float::INFINITY && distances[u] + weight < distances[v]
      raise "graph contains a negative-weight cycle"
    end
  end

  distances
end

edges = [
  [0, 1, 4],
  [0, 2, 5],
  [1, 2, -3],
  [2, 3, 4],
  [3, 1, 1]
]

puts bellman_ford(edges, 4, 0).inspect
