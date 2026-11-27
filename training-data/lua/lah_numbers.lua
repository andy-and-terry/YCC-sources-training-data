local function lah(n, k)
  local c = 1
  for i = 0, k - 2 do c = c * (n - 1 - i) // (i + 1) end
  local f = 1
  for i = k + 1, n do f = f * i end
  return c * f
end

for n = 1, 5 do
  local row = {}
  for k = 1, n do row[k] = lah(n, k) end
  print(table.concat(row, " "))
end
