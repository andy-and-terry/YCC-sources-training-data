local function groupBy(list, keyFn)
  local groups = {}
  for _, item in ipairs(list) do
    local k = keyFn(item)
    groups[k] = groups[k] or {}
    table.insert(groups[k], item)
  end
  return groups
end

local words = { "apple", "avocado", "banana", "blueberry", "cherry", "apricot" }
local g = groupBy(words, function(w) return w:sub(1, 1) end)
for _, letter in ipairs({ "a", "b", "c" }) do
  print(letter, table.concat(g[letter], ","))
end
