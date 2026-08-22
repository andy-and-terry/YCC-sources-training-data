def topological_sort(num_nodes, edges)
  graph = Array.new(num_nodes) { [] }
  in_degree = Array.new(num_nodes, 0)
  edges.each do |u, v|
    graph[u] << v
    in_degree[v] += 1
  end

  queue = (0...num_nodes).select { |n| in_degree[n].zero? }
  order = []
  until queue.empty?
    node = queue.shift
    order << node
    graph[node].each do |neighbor|
      in_degree[neighbor] -= 1
      queue << neighbor if in_degree[neighbor].zero?
    end
  end

  raise 'graph has a cycle' if order.length != num_nodes
  order
end

puts topological_sort(6, [[5, 2], [5, 0], [4, 0], [4, 1], [2, 3], [3, 1]]).inspect
