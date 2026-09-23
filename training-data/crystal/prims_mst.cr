def prim(graph : Hash(Int32, Array(Tuple(Int32, Int32))), node_count : Int32) : Int32
  in_mst = Array.new(node_count, false)
  key = Array.new(node_count, Int32::MAX)
  key[0] = 0
  total_weight = 0

  node_count.times do
    u = -1
    best = Int32::MAX
    node_count.times do |i|
      if !in_mst[i] && key[i] < best
        best = key[i]
        u = i
      end
    end
    break if u == -1

    in_mst[u] = true
    total_weight += key[u]

    if edges = graph[u]?
      edges.each do |v, weight|
        if !in_mst[v] && weight < key[v]
          key[v] = weight
        end
      end
    end
  end

  total_weight
end

graph = {
  0 => [{1, 2}, {2, 3}],
  1 => [{0, 2}, {2, 1}, {3, 4}],
  2 => [{0, 3}, {1, 1}, {3, 5}],
  3 => [{1, 4}, {2, 5}],
}

puts prim(graph, 4)
