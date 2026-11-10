function central_delannoy(n)
    g = ones(Int, n + 1, n + 1)
    for i in 2:n+1, j in 2:n+1
        g[i, j] = g[i-1, j] + g[i, j-1] + g[i-1, j-1]
    end
    g[n+1, n+1]
end

println([central_delannoy(n) for n in 0:5]) # [1, 3, 13, 63, 321, 1683]
