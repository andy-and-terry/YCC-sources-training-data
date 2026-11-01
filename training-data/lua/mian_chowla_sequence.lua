-- Greedy sequence whose pairwise sums are all distinct.
local seq, sums = {}, {}
local cand = 1
while #seq < 8 do
  local fresh, ok = {}, true
  seq[#seq + 1] = cand
  for _, x in ipairs(seq) do
    local s = x + cand
    if sums[s] or fresh[s] then ok = false; break end
    fresh[s] = true
  end
  if ok then
    for s in pairs(fresh) do sums[s] = true end
  else
    seq[#seq] = nil
  end
  cand = cand + 1
end
print(table.concat(seq, " "))
