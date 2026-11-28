local function to_set(t)
  local s = {}
  for _, v in ipairs(t) do s[v] = true end
  return s
end

local function jaccard(a, b)
  local sa, sb = to_set(a), to_set(b)
  local inter, union = 0, 0
  local all = {}
  for k in pairs(sa) do all[k] = true end
  for k in pairs(sb) do all[k] = true end
  for k in pairs(all) do
    union = union + 1
    if sa[k] and sb[k] then inter = inter + 1 end
  end
  return union == 0 and 1 or inter / union
end

print(jaccard({1, 2, 3, 4}, {3, 4, 5}))
