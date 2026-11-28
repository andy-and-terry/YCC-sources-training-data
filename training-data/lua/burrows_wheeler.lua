local function bwt(s)
  local rots = {}
  for i = 1, #s do rots[i] = s:sub(i) .. s:sub(1, i - 1) end
  table.sort(rots)
  local out = {}
  for i, r in ipairs(rots) do out[i] = r:sub(-1) end
  return table.concat(out)
end

print(bwt("banana$"))
