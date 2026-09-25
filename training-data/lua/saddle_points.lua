local function saddle_points(m)
  local col_min, out = {}, {}
  for c = 1, #m[1] do
    col_min[c] = math.huge
    for r = 1, #m do col_min[c] = math.min(col_min[c], m[r][c]) end
  end
  for r, row in ipairs(m) do
    local row_max = math.max(table.unpack(row))
    for c, v in ipairs(row) do
      if v == row_max and v == col_min[c] then out[#out + 1] = string.format("(%d,%d)", r, c) end
    end
  end
  return out
end

print(table.concat(saddle_points({ { 9, 8, 7 }, { 5, 3, 2 }, { 6, 6, 7 } }), " "))
