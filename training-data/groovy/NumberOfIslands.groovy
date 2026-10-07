int numIslands(char[][] grid) {
    def rows = grid.length
    if (rows == 0) return 0
    def cols = grid[0].length

    def flood
    flood = { int r, int c ->
        if (r < 0 || r >= rows || c < 0 || c >= cols || grid[r][c] != '1' as char) return
        grid[r][c] = '0' as char
        flood(r + 1, c)
        flood(r - 1, c)
        flood(r, c + 1)
        flood(r, c - 1)
    }

    int count = 0
    for (r in 0..<rows) {
        for (c in 0..<cols) {
            if (grid[r][c] == '1' as char) {
                count++
                flood(r, c)
            }
        }
    }
    count
}

def grid = [
    "11000".toCharArray(),
    "11000".toCharArray(),
    "00100".toCharArray(),
    "00011".toCharArray()
] as char[][]
println "islands: ${numIslands(grid)}"
