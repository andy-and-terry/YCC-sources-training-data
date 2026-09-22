graph = {
  "a" => [{"b", 4}, {"c", 1}],
  "b" => [{"d", 1}],
  "c" => [{"b", 2}, {"d", 5}],
  "d" => [] of {String, Int32},
}

dist = Hash(String, Int32).new(Int32::MAX)
dist["a"] = 0
visited = Set(String).new

graph.size.times do
  current = nil
  best = Int32::MAX
  graph.each_key do |node|
    if !visited.includes?(node) && dist[node] < best
      best = dist[node]
      current = node
    end
  end
  break unless current

  visited << current
  graph[current].each do |(neighbor, weight)|
    nd = dist[current] + weight
    dist[neighbor] = nd if nd < dist[neighbor]
  end
end

["a", "b", "c", "d"].each do |node|
  puts "#{node}: #{dist[node]}"
end
