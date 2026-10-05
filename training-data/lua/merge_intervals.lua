local function merge_intervals(intervals)
  table.sort(intervals, function(a, b) return a[1] < b[1] end)
  local out = {}
  for _, iv in ipairs(intervals) do
    local last = out[#out]
    if last and iv[1] <= last[2] then
      last[2] = math.max(last[2], iv[2])
    else
      out[#out + 1] = { iv[1], iv[2] }
    end
  end
  return out
end

for _, iv in ipairs(merge_intervals({ { 1, 3 }, { 8, 10 }, { 2, 6 }, { 15, 18 } })) do
  print(iv[1], iv[2])
end
