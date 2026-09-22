def floyd_warshall(graph)
  nodes = graph.keys
  dist = {}
  nodes.each do |i|
    dist[i] = {}
    nodes.each do |j|
      dist[i][j] = if i == j
                      0
                    elsif graph[i].key?(j)
                      graph[i][j]
                    else
                      Float::INFINITY
                    end
    end
  end

  nodes.each do |k|
    nodes.each do |i|
      nodes.each do |j|
        via_k = dist[i][k] + dist[k][j]
        dist[i][j] = via_k if via_k < dist[i][j]
      end
    end
  end

  dist
end

graph = {
  'a' => { 'b' => 3, 'c' => 8 },
  'b' => { 'c' => -2, 'd' => 1 },
  'c' => {},
  'd' => { 'a' => 2, 'c' => -5 }
}

result = floyd_warshall(graph)
result.each do |from, targets|
  targets.each do |to, d|
    puts "#{from} -> #{to}: #{d}"
  end
end
