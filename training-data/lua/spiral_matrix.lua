local function spiral(m)
  local out = {}
  local top, bottom, left, right = 1, #m, 1, #m[1]
  while top <= bottom and left <= right do
    for j = left, right do out[#out + 1] = m[top][j] end
    top = top + 1
    for i = top, bottom do out[#out + 1] = m[i][right] end
    right = right - 1
    if top <= bottom then
      for j = right, left, -1 do out[#out + 1] = m[bottom][j] end
      bottom = bottom - 1
    end
    if left <= right then
      for i = bottom, top, -1 do out[#out + 1] = m[i][left] end
      left = left + 1
    end
  end
  return out
end

print(table.concat(spiral({ { 1, 2, 3 }, { 4, 5, 6 }, { 7, 8, 9 } }), " "))
