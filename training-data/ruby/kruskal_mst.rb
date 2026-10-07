class DisjointSet
  def initialize(size)
    @parent = Array.new(size) { |i| i }
  end

  def find(node)
    @parent[node] = find(@parent[node]) if @parent[node] != node
    @parent[node]
  end

  def union(a, b)
    root_a = find(a)
    root_b = find(b)
    return false if root_a == root_b

    @parent[root_a] = root_b
    true
  end
end

def kruskal(vertex_count, edges)
  disjoint_set = DisjointSet.new(vertex_count)
  mst = []

  edges.sort_by { |edge| edge[2] }.each do |u, v, weight|
    mst << [u, v, weight] if disjoint_set.union(u, v)
  end

  mst
end

edges = [
  [0, 1, 4],
  [0, 2, 1],
  [2, 1, 2],
  [1, 3, 5],
  [2, 3, 8]
]

result = kruskal(4, edges)
puts result.inspect
puts result.sum { |_, _, weight| weight }
