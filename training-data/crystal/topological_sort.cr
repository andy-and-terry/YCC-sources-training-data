def topological_sort(graph : Hash(Int32, Array(Int32)), node_count : Int32) : Array(Int32)
  in_degree = Array.new(node_count, 0)
  graph.each_value { |neighbors| neighbors.each { |n| in_degree[n] += 1 } }
  queue = (0...node_count).select { |i| in_degree[i] == 0 }.to_a
  result = [] of Int32
  until queue.empty?
    node = queue.shift
    result << node
    (graph[node]? || [] of Int32).each do |neighbor|
      in_degree[neighbor] -= 1
      queue << neighbor if in_degree[neighbor] == 0
    end
  end
  result
end

graph = {0 => [1, 2], 1 => [3], 2 => [3], 3 => [] of Int32}
puts topological_sort(graph, 4).inspect
