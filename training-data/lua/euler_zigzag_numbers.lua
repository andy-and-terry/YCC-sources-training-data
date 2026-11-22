-- Euler zigzag numbers via the Seidel-Entringer boustrophedon.
local row, out = { 1 }, { 1 }
for _ = 1, 9 do
  local nxt = { 0 }
  for j = #row, 1, -1 do nxt[#nxt + 1] = nxt[#nxt] + row[j] end
  row = nxt
  out[#out + 1] = row[#row]
end
print(table.concat(out, " "))
