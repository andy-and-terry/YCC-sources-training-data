local function modes(items)
  local counts, top = {}, 0
  for _, x in ipairs(items) do
    counts[x] = (counts[x] or 0) + 1
    if counts[x] > top then top = counts[x] end
  end
  local out = {}
  for k, c in pairs(counts) do
    if c == top then out[#out + 1] = k end
  end
  table.sort(out)
  return out
end

print(table.concat(modes({ 1, 2, 2, 3, 3, 4 }), ","))
