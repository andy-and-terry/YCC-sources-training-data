def floyd_warshall(num_nodes : Int32, edges : Array(Tuple(Int32, Int32, Int32))) : Array(Array(Int32))
  inf = Int32::MAX // 2
  dist = Array.new(num_nodes) { Array.new(num_nodes, inf) }
  num_nodes.times { |i| dist[i][i] = 0 }
  edges.each do |u, v, w|
    dist[u][v] = w
  end

  num_nodes.times do |k|
    num_nodes.times do |i|
      num_nodes.times do |j|
        if dist[i][k] + dist[k][j] < dist[i][j]
          dist[i][j] = dist[i][k] + dist[k][j]
        end
      end
    end
  end

  dist
end

edges = [
  {0, 1, 3},
  {0, 2, 8},
  {1, 2, 2},
  {2, 3, 1},
  {3, 0, 4},
]

floyd_warshall(4, edges).each do |row|
  puts row.join(" ")
end
