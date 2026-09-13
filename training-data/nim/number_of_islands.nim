proc numIslands(grid: var seq[seq[char]]): int =
  let rows = grid.len
  if rows == 0:
    return 0
  let cols = grid[0].len
  proc dfs(r, c: int) =
    if r < 0 or r >= rows or c < 0 or c >= cols or grid[r][c] != '1':
      return
    grid[r][c] = '0'
    dfs(r - 1, c)
    dfs(r + 1, c)
    dfs(r, c - 1)
    dfs(r, c + 1)
  for r in 0 ..< rows:
    for c in 0 ..< cols:
      if grid[r][c] == '1':
        result += 1
        dfs(r, c)

var grid = @[
  @['1', '1', '0', '0'],
  @['1', '1', '0', '0'],
  @['0', '0', '1', '0'],
  @['0', '0', '0', '1']
]
echo numIslands(grid)
