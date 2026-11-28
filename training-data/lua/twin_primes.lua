local n = 50
local composite = {}
for i = 2, math.floor(math.sqrt(n)) do
  if not composite[i] then
    for j = i * i, n, i do composite[j] = true end
  end
end
local out = {}
for p = 3, n - 2 do
  if not composite[p] and not composite[p + 2] then
    out[#out + 1] = "(" .. p .. ", " .. p + 2 .. ")"
  end
end
print(table.concat(out, " "))
