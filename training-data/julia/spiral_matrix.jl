function spiral(n::Int)
    g = zeros(Int, n, n)
    dirs = [(0, 1), (1, 0), (0, -1), (-1, 0)]
    r, c, d = 1, 1, 1
    for k in 1:n^2
        g[r, c] = k
        nr, nc = r + dirs[d][1], c + dirs[d][2]
        if !(1 <= nr <= n && 1 <= nc <= n) || g[nr, nc] != 0
            d = mod1(d + 1, 4)
        end
        r += dirs[d][1]
        c += dirs[d][2]
    end
    return g
end

display(spiral(4))
println()
