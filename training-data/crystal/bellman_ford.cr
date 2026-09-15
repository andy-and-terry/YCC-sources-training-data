record Edge, from : Int32, to : Int32, weight : Int32

def bellman_ford(edges : Array(Edge), node_count : Int32, source : Int32) : Array(Int32)?
  dist = Array.new(node_count, Int32::MAX)
  dist[source] = 0

  (node_count - 1).times do
    edges.each do |edge|
      next if dist[edge.from] == Int32::MAX
      if dist[edge.from] + edge.weight < dist[edge.to]
        dist[edge.to] = dist[edge.from] + edge.weight
      end
    end
  end

  edges.each do |edge|
    next if dist[edge.from] == Int32::MAX
    return nil if dist[edge.from] + edge.weight < dist[edge.to]
  end

  dist
end

edges = [
  Edge.new(0, 1, 4),
  Edge.new(0, 2, 5),
  Edge.new(1, 2, -3),
  Edge.new(2, 3, 4),
]

result = bellman_ford(edges, 4, 0)
puts result.nil? ? "negative cycle detected" : result.inspect
