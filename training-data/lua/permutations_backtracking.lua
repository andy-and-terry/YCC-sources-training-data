local function permutations(list)
  local result = {}
  local current = {}
  local used = {}

  local function backtrack()
    if #current == #list then
      local copy = {}
      for i, v in ipairs(current) do copy[i] = v end
      table.insert(result, copy)
      return
    end
    for i, v in ipairs(list) do
      if not used[i] then
        used[i] = true
        table.insert(current, v)
        backtrack()
        table.remove(current)
        used[i] = false
      end
    end
  end

  backtrack()
  return result
end

local perms = permutations({ 1, 2, 3 })
for _, p in ipairs(perms) do
  print(table.concat(p, ","))
end
print("total:", #perms)
