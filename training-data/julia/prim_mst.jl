function prim_mst(graph::Matrix{Int})
    n = size(graph, 1)
    INF = typemax(Int)
    key = fill(INF, n)
    parent = fill(-1, n)
    in_mst = falses(n)
    key[1] = 0
    for _ in 1:n
        u = -1
        best = INF
        for v in 1:n
            if !in_mst[v] && key[v] < best
                best = key[v]
                u = v
            end
        end
        in_mst[u] = true
        for v in 1:n
            if graph[u, v] != 0 && !in_mst[v] && graph[u, v] < key[v]
                key[v] = graph[u, v]
                parent[v] = u
            end
        end
    end
    return parent, key
end

graph = [0 2 0 6 0;
         2 0 3 8 5;
         0 3 0 0 7;
         6 8 0 0 9;
         0 5 7 9 0]

parent, key = prim_mst(graph)
println(parent)
println(sum(key))
