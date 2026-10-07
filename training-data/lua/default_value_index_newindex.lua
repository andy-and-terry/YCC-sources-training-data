-- __index and __newindex give tables defaults and write interception.
local function with_default(t, default)
  return setmetatable(t, { __index = function() return default end })
end

local counts = with_default({}, 0)
for _, w in ipairs({ "a", "b", "a" }) do counts[w] = counts[w] + 1 end
print(counts.a, counts.b, counts.zzz)

-- autovivification
local function tree()
  return setmetatable({}, { __index = function(t, k)
    local child = tree()
    rawset(t, k, child)
    return child
  end })
end
local cfg = tree()
cfg.db.host = "localhost"
cfg.db.port = 5432
print(cfg.db.host, cfg.db.port)

-- logging writes
local log = {}
local tracked = setmetatable({}, {
  __newindex = function(t, k, v)
    log[#log + 1] = k .. "=" .. tostring(v)
    rawset(t, k, v)
  end,
})
tracked.x = 1
tracked.x = 2   -- already present: no __newindex
tracked.y = 3
print(table.concat(log, ","))

-- __index chain with a table
local base = { greet = function() return "hi" end }
local obj = setmetatable({}, { __index = base })
print(obj.greet(), rawget(obj, "greet"))
