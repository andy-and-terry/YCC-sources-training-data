defmodule UnionFind do
  def new(n), do: Map.new(0..(n - 1), fn i -> {i, i} end)

  def find(parents, x) do
    case Map.get(parents, x) do
      ^x -> x
      parent -> find(parents, parent)
    end
  end

  def union(parents, x, y) do
    root_x = find(parents, x)
    root_y = find(parents, y)

    if root_x == root_y do
      parents
    else
      Map.put(parents, root_x, root_y)
    end
  end
end

uf = UnionFind.new(5)
uf = UnionFind.union(uf, 0, 1)
uf = UnionFind.union(uf, 1, 2)
IO.inspect(UnionFind.find(uf, 0) == UnionFind.find(uf, 2))
IO.inspect(UnionFind.find(uf, 0) == UnionFind.find(uf, 3))
