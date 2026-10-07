local function withDefault(default)
  return setmetatable({}, {
    __index = function() return default end,
  })
end

local counts = withDefault(0)
for word in ("a b a c a b"):gmatch("%a") do
  counts[word] = counts[word] + 1
end
print(counts.a, counts.b, counts.c, counts.zzz)

local function autoTable()
  return setmetatable({}, {
    __index = function(t, k)
      local child = autoTable()
      rawset(t, k, child)
      return child
    end,
  })
end

local config = autoTable()
config.server.http.port = 8080
config.server.http.host = "localhost"
config.db.name = "main"
print(config.server.http.port, config.server.http.host, config.db.name)

local groups = setmetatable({}, {
  __index = function(t, k)
    t[k] = {}
    return t[k]
  end,
})
for i = 1, 6 do
  table.insert(groups[i % 3], i)
end
for k = 0, 2 do
  print(k, table.concat(groups[k], ","))
end

local defaults = { color = "red", size = 10 }
local item = setmetatable({ size = 20 }, { __index = defaults })
print(item.color, item.size, rawget(item, "color"))
