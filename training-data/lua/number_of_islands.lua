local function flood(grid, r, c, rows, cols)
  if r < 1 or r > rows or c < 1 or c > cols or grid[r][c] ~= 1 then return end
  grid[r][c] = 0
  flood(grid, r + 1, c, rows, cols)
  flood(grid, r - 1, c, rows, cols)
  flood(grid, r, c + 1, rows, cols)
  flood(grid, r, c - 1, rows, cols)
end

local function num_islands(grid)
  local rows = #grid
  local cols = #grid[1]
  local count = 0
  for r = 1, rows do
    for c = 1, cols do
      if grid[r][c] == 1 then
        count = count + 1
        flood(grid, r, c, rows, cols)
      end
    end
  end
  return count
end

local grid = {
  { 1, 1, 0, 0, 0 },
  { 1, 1, 0, 0, 0 },
  { 0, 0, 1, 0, 0 },
  { 0, 0, 0, 1, 1 },
}

print("islands:", num_islands(grid))
