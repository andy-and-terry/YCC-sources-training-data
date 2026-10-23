function step(grid::BitMatrix)
    rows, cols = size(grid)
    next = falses(rows, cols)
    for i in 1:rows, j in 1:cols
        n = 0
        for di in -1:1, dj in -1:1
            (di == 0 && dj == 0) && continue
            ni, nj = mod1(i + di, rows), mod1(j + dj, cols)
            n += grid[ni, nj]
        end
        next[i, j] = grid[i, j] ? n in (2, 3) : n == 3
    end
    next
end

show_grid(g) = foreach(r -> println(join(x ? '#' : '.' for x in r)), eachrow(g))

grid = falses(6, 6)
grid[1, 2] = grid[2, 3] = grid[3, 1] = grid[3, 2] = grid[3, 3] = true
for gen in 1:3
    println("Generation ", gen)
    show_grid(grid)
    global grid = step(grid)
end
