local function histogram(s, width)
  width = width or 30
  local counts, keys, peak = {}, {}, 0
  for c in s:gmatch(".") do
    if not counts[c] then keys[#keys + 1] = c end
    counts[c] = (counts[c] or 0) + 1
    peak = math.max(peak, counts[c])
  end
  table.sort(keys)
  for _, k in ipairs(keys) do
    local n = counts[k]
    print(k .. " | " .. string.rep("#", math.max(1, n * width // peak)) .. " " .. n)
  end
end

histogram("theraininspainfallsmainlyontheplain")
