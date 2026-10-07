def floyd_warshall(graph : Array(Array(Int32))) : Array(Array(Int32))
  n = graph.size
  dist = graph.map(&.dup)

  n.times do |k|
    n.times do |i|
      n.times do |j|
        next if dist[i][k] == Int32::MAX || dist[k][j] == Int32::MAX
        through_k = dist[i][k] + dist[k][j]
        dist[i][j] = through_k if through_k < dist[i][j]
      end
    end
  end

  dist
end

inf = Int32::MAX
graph = [
  [0, 3, inf, 7],
  [8, 0, 2, inf],
  [5, inf, 0, 1],
  [2, inf, inf, 0],
]

floyd_warshall(graph).each { |row| puts row.inspect }
