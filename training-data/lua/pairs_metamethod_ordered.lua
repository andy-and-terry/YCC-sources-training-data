-- Lua 5.2+ honours __pairs; iterate a table in sorted key order
local function ordered(t)
  return setmetatable({}, {
    __pairs = function()
      local keys = {}
      for k in next, t do keys[#keys + 1] = k end
      table.sort(keys)
      local i = 0
      return function()
        i = i + 1
        local k = keys[i]
        if k ~= nil then return k, t[k] end
      end
    end,
  })
end

for k, v in pairs(ordered({ pear = 3, apple = 1, fig = 2 })) do
  print(k, v)
end
