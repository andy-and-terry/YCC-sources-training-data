class UnionFind
  def initialize(n : Int32)
    @parent = Array.new(n) { |i| i }
    @rank = Array.new(n, 0)
  end

  def find(x : Int32) : Int32
    @parent[x] = find(@parent[x]) if @parent[x] != x
    @parent[x]
  end

  def union(a : Int32, b : Int32)
    root_a = find(a)
    root_b = find(b)
    return if root_a == root_b
    if @rank[root_a] < @rank[root_b]
      @parent[root_a] = root_b
    elsif @rank[root_a] > @rank[root_b]
      @parent[root_b] = root_a
    else
      @parent[root_b] = root_a
      @rank[root_a] += 1
    end
  end

  def connected?(a : Int32, b : Int32) : Bool
    find(a) == find(b)
  end
end

uf = UnionFind.new(6)
uf.union(0, 1)
uf.union(1, 2)
puts uf.connected?(0, 2)
puts uf.connected?(0, 5)
