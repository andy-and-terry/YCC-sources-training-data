-- Lua 5.4: <const> and <close> variable attributes.
local MAX <const> = 10
print(MAX * 2)

local function resource(name)
  return setmetatable({ name = name }, {
    __close = function(self, err)
      print("closing " .. self.name .. (err and (" after error: " .. tostring(err)) or ""))
    end,
  })
end

do
  local a <close> = resource("A")
  local b <close> = resource("B")
  print("using A and B")
end

local ok, msg = pcall(function()
  local r <close> = resource("R")
  error("failure inside", 0)
end)
print(ok, msg)

local function early()
  local r <close> = resource("early")
  return "returned"
end
print(early())

for i = 1, 2 do
  local tmp <close> = resource("loop" .. i)
end
