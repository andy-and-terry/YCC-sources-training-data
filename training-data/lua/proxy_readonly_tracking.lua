local function readonly(t)
  return setmetatable({}, {
    __index = t,
    __newindex = function(_, k) error("attempt to modify readonly field " .. tostring(k), 2) end,
    __len = function() return #t end,
    __pairs = function() return pairs(t) end,
  })
end
local days = readonly({ "mon", "tue" })
print(days[1], #days)
print(pcall(function() days[3] = "wed" end))

local log = {}
local tracked = setmetatable({}, {
  __index = function(_, k) log[#log + 1] = "get " .. k; return 0 end,
  __newindex = function(t, k, v) log[#log + 1] = "set " .. k; rawset(t, k, v) end,
})
tracked.x = tracked.y + 5
print(table.concat(log, ", "), rawget(tracked, "x"))
local defaults = setmetatable({}, { __index = function() return "default" end })
print(defaults.anything)
