mutable struct UnionFind
    parent::Vector{Int}
    UnionFind(n::Int) = new(collect(1:n))
end

function find(uf::UnionFind, x::Int)
    if uf.parent[x] == x
        return x
    end
    uf.parent[x] = find(uf, uf.parent[x])
    return uf.parent[x]
end

function union!(uf::UnionFind, x::Int, y::Int)
    root_x = find(uf, x)
    root_y = find(uf, y)
    if root_x == root_y
        return false
    end
    uf.parent[root_x] = root_y
    return true
end

function kruskal(n::Int, edges::Vector{Tuple{Int, Int, Int}})
    uf = UnionFind(n)
    mst = Tuple{Int, Int, Int}[]
    for (u, v, w) in sort(edges, by = e -> e[3])
        if union!(uf, u, v)
            push!(mst, (u, v, w))
        end
    end
    return mst
end

edges = [(1, 2, 1), (1, 3, 3), (2, 3, 4), (2, 4, 2), (3, 4, 5)]
println(kruskal(4, edges))
