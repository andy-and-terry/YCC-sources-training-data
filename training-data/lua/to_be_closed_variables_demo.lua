-- Lua 5.4: variables declared <close> run their __close metamethod on scope exit.
local function resource(name)
  print("open " .. name)
  return setmetatable({ name = name }, {
    __close = function(self, err)
      print("close " .. self.name .. (err and (" after error: " .. tostring(err)) or ""))
    end,
  })
end

do
  local a <close> = resource("A")
  local b <close> = resource("B")
  print("inside block")
end

local function early_return()
  local r <close> = resource("R")
  if true then
    return "returned early"
  end
  return "unreachable"
end
print(early_return())

local ok, err = pcall(function()
  local x <close> = resource("X")
  error("boom", 0)
end)
print(ok, err)

for i = 1, 2 do
  local loop <close> = resource("loop" .. i)
end

local const <const> = 10
print(const + 1)
