local function rotate_clockwise(m)
  local rows, cols, out = #m, #m[1], {}
  for c = 1, cols do
    out[c] = {}
    for r = rows, 1, -1 do out[c][#out[c] + 1] = m[r][c] end
  end
  return out
end

for _, row in ipairs(rotate_clockwise({ { 1, 2, 3 }, { 4, 5, 6 }, { 7, 8, 9 } })) do
  print(table.concat(row, " "))
end
