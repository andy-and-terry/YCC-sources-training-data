local function zigzag(s, rows)
  if rows == 1 or rows >= #s then return s end
  local lines = {}
  for i = 1, rows do lines[i] = {} end
  local r, step = 1, 1
  for c in s:gmatch(".") do
    table.insert(lines[r], c)
    if r == 1 then step = 1 elseif r == rows then step = -1 end
    r = r + step
  end
  for i = 1, rows do lines[i] = table.concat(lines[i]) end
  return table.concat(lines)
end

print(zigzag("PAYPALISHIRING", 3))
