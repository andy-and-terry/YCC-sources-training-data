local function ugly(n)
  local seq, i2, i3, i5 = { 1 }, 1, 1, 1
  while #seq < n do
    local nxt = math.min(seq[i2] * 2, seq[i3] * 3, seq[i5] * 5)
    seq[#seq + 1] = nxt
    if nxt == seq[i2] * 2 then i2 = i2 + 1 end
    if nxt == seq[i3] * 3 then i3 = i3 + 1 end
    if nxt == seq[i5] * 5 then i5 = i5 + 1 end
  end
  return seq[n]
end

local out = {}
for i = 1, 12 do out[i] = ugly(i) end
print(table.concat(out, " "))
