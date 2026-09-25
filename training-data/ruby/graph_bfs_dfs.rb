graph = {
  'A' => ['B', 'C'],
  'B' => ['D'],
  'C' => ['D'],
  'D' => ['E'],
  'E' => []
}

def bfs(graph, start)
  visited = [start]
  queue = [start]
  order = []

  until queue.empty?
    node = queue.shift
    order << node
    graph[node].each do |neighbor|
      next if visited.include?(neighbor)

      visited << neighbor
      queue << neighbor
    end
  end

  order
end

def dfs(graph, start, visited = [], order = [])
  return order if visited.include?(start)

  visited << start
  order << start
  graph[start].each { |neighbor| dfs(graph, neighbor, visited, order) }
  order
end

puts bfs(graph, 'A').inspect
puts dfs(graph, 'A').inspect
