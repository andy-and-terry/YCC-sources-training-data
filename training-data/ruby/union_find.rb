class UnionFind
  def initialize(size)
    @parent = Array.new(size) { |i| i }
    @rank = Array.new(size, 0)
  end

  def find(x)
    @parent[x] = find(@parent[x]) if @parent[x] != x
    @parent[x]
  end

  def union(a, b)
    root_a, root_b = find(a), find(b)
    return false if root_a == root_b
    root_a, root_b = root_b, root_a if @rank[root_a] < @rank[root_b]
    @parent[root_b] = root_a
    @rank[root_a] += 1 if @rank[root_a] == @rank[root_b]
    true
  end
end

uf = UnionFind.new(5)
uf.union(0, 1)
uf.union(1, 2)
puts "#{uf.find(0) == uf.find(2)} #{uf.find(0) == uf.find(3)}"
