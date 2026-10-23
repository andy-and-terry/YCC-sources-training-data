#!/usr/bin/awk -f
# Conway's Game of Life on a small fixed grid, a glider for four generations
function show(g,    r, c, line) {
    for (r = 1; r <= H; r++) {
        line = ""
        for (c = 1; c <= W; c++) line = line (g[r, c] ? "#" : ".")
        print line
    }
}
function neighbors(g, r, c,    dr, dc, n) {
    for (dr = -1; dr <= 1; dr++)
        for (dc = -1; dc <= 1; dc++)
            if ((dr || dc) && g[r + dr, c + dc]) n++
    return n + 0
}
function step(    r, c, n) {
    for (r = 1; r <= H; r++)
        for (c = 1; c <= W; c++) {
            n = neighbors(grid, r, c)
            nxt[r, c] = (n == 3 || (n == 2 && grid[r, c])) ? 1 : 0
        }
    for (k in nxt) grid[k] = nxt[k]
}
BEGIN {
    H = 6; W = 6
    grid[1, 2] = grid[2, 3] = grid[3, 1] = grid[3, 2] = grid[3, 3] = 1
    for (gen = 0; gen <= 3; gen++) {
        print "generation " gen
        show(grid)
        step()
    }
}
