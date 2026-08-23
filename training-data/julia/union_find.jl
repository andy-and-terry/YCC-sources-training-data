mutable struct UnionFind
    parent::Vector{Int}
    UnionFind(n::Int) = new(collect(1:n))
end

function find(uf::UnionFind, x::Int)
    if uf.parent[x] == x
        return x
    end
    return find(uf, uf.parent[x])
end

function union!(uf::UnionFind, x::Int, y::Int)
    root_x = find(uf, x)
    root_y = find(uf, y)
    if root_x != root_y
        uf.parent[root_x] = root_y
    end
end

uf = UnionFind(5)
union!(uf, 1, 2)
union!(uf, 2, 3)
println(find(uf, 1) == find(uf, 3))
println(find(uf, 1) == find(uf, 4))
