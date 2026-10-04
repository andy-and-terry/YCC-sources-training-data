local function with_default(t, default)
  return setmetatable(t, { __index = function() return default end })
end

local counts = with_default({}, 0)
for _, w in ipairs({ "a", "b", "a", "c", "a" }) do
  counts[w] = counts[w] + 1
end
print(counts.a, counts.b, counts.zzz)

local auto = setmetatable({}, {
  __index = function(t, k)
    local v = {}
    rawset(t, k, v)
    return v
  end,
})
auto.x.y = 1
print(auto.x.y, rawget(auto, "q"))

local log = {}
local tracked = setmetatable({}, {
  __newindex = function(t, k, v)
    log[#log + 1] = k
    rawset(t, k, v)
  end,
})
tracked.a = 1
tracked.b = 2
tracked.a = 3
print(table.concat(log, ","), tracked.a)
