def has_cycle?(graph : Hash(Int32, Array(Int32)), nodes : Array(Int32)) : Bool
  color = Hash(Int32, Int32).new(0) # 0 = white, 1 = gray, 2 = black

  nodes.each do |node|
    return true if color[node] == 0 && dfs(node, graph, color)
  end

  false
end

def dfs(node : Int32, graph : Hash(Int32, Array(Int32)), color : Hash(Int32, Int32)) : Bool
  color[node] = 1
  graph.fetch(node, [] of Int32).each do |neighbor|
    return true if color[neighbor] == 1
    return true if color[neighbor] == 0 && dfs(neighbor, graph, color)
  end
  color[node] = 2
  false
end

acyclic = {0 => [1], 1 => [2], 2 => [] of Int32}
cyclic = {0 => [1], 1 => [2], 2 => [0]}

puts has_cycle?(acyclic, [0, 1, 2]) # false
puts has_cycle?(cyclic, [0, 1, 2])  # true
