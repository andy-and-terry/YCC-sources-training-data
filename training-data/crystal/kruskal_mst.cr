class KruskalUnionFind
  def initialize(n : Int32)
    @parent = Array.new(n) { |i| i }
  end

  def find(x : Int32) : Int32
    @parent[x] = find(@parent[x]) if @parent[x] != x
    @parent[x]
  end

  def union(a : Int32, b : Int32) : Bool
    root_a = find(a)
    root_b = find(b)
    return false if root_a == root_b
    @parent[root_a] = root_b
    true
  end
end

def kruskal(num_nodes : Int32, edges : Array(Tuple(Int32, Int32, Int32))) : Array(Tuple(Int32, Int32, Int32))
  sorted_edges = edges.sort_by { |edge| edge[2] }
  uf = KruskalUnionFind.new(num_nodes)
  mst = [] of Tuple(Int32, Int32, Int32)

  sorted_edges.each do |edge|
    u, v, weight = edge
    mst << edge if uf.union(u, v)
  end

  mst
end

edges = [
  {0, 1, 1},
  {0, 2, 3},
  {1, 2, 4},
  {1, 3, 2},
  {2, 3, 5},
]

kruskal(4, edges).each do |u, v, w|
  puts "#{u}-#{v}:#{w}"
end
