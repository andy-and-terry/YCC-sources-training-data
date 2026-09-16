defmodule KruskalUnionFind do
  def new(n), do: Map.new(0..(n - 1), fn i -> {i, i} end)

  def find(parents, x) do
    case Map.get(parents, x) do
      ^x -> x
      parent -> find(parents, parent)
    end
  end

  def union(parents, a, b) do
    root_a = find(parents, a)
    root_b = find(parents, b)

    if root_a == root_b do
      {parents, false}
    else
      {Map.put(parents, root_a, root_b), true}
    end
  end
end

defmodule Kruskal do
  def mst(num_nodes, edges) do
    sorted = Enum.sort_by(edges, fn {_, _, weight} -> weight end)
    uf = KruskalUnionFind.new(num_nodes)

    {_, result} =
      Enum.reduce(sorted, {uf, []}, fn {u, v, _weight} = edge, {uf_acc, mst_acc} ->
        case KruskalUnionFind.union(uf_acc, u, v) do
          {new_uf, true} -> {new_uf, [edge | mst_acc]}
          {new_uf, false} -> {new_uf, mst_acc}
        end
      end)

    Enum.reverse(result)
  end
end

edges = [{0, 1, 1}, {0, 2, 3}, {1, 2, 4}, {1, 3, 2}, {2, 3, 5}]

Kruskal.mst(4, edges)
|> Enum.each(fn {u, v, w} -> IO.puts("#{u}-#{v}:#{w}") end)
