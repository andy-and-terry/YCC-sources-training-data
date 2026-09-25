local function spiral(n)
  local g = {}
  for r = 1, n do g[r] = {} end
  local top, left, bottom, right, k = 1, 1, n, n, 1
  while top <= bottom and left <= right do
    for c = left, right do g[top][c] = k; k = k + 1 end
    top = top + 1
    for r = top, bottom do g[r][right] = k; k = k + 1 end
    right = right - 1
    if top <= bottom then
      for c = right, left, -1 do g[bottom][c] = k; k = k + 1 end
      bottom = bottom - 1
    end
    if left <= right then
      for r = bottom, top, -1 do g[r][left] = k; k = k + 1 end
      left = left + 1
    end
  end
  return g
end

for _, row in ipairs(spiral(4)) do print(table.concat(row, "\t")) end
