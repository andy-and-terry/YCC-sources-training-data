function jaccard(a, b)
    A, B = Set(a), Set(b)
    u = length(union(A, B))
    return u == 0 ? 1.0 : length(intersect(A, B)) / u
end

println(jaccard([1, 2, 3, 4], [3, 4, 5]))
