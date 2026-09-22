proc dfs(grid: var seq[seq[char]], r, c, rows, cols: int) =
  if r < 0 or r >= rows or c < 0 or c >= cols or grid[r][c] != '1':
    return
  grid[r][c] = '0'
  dfs(grid, r - 1, c, rows, cols)
  dfs(grid, r + 1, c, rows, cols)
  dfs(grid, r, c - 1, rows, cols)
  dfs(grid, r, c + 1, rows, cols)

proc numIslands(grid: var seq[seq[char]]): int =
  let rows = grid.len
  if rows == 0:
    return 0
  let cols = grid[0].len
  for r in 0 ..< rows:
    for c in 0 ..< cols:
      if grid[r][c] == '1':
        result += 1
        dfs(grid, r, c, rows, cols)

var grid = @[
  @['1', '1', '0', '0'],
  @['1', '1', '0', '0'],
  @['0', '0', '1', '0'],
  @['0', '0', '0', '1']
]
echo numIslands(grid)
