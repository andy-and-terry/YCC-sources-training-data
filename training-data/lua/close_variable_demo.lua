local function make_resource(name)
  return setmetatable({ name = name }, {
    __close = function(self, err)
      print("closing " .. self.name, err)
    end,
  })
end

do
  local a <close> = make_resource("A")
  local b <close> = make_resource("B")
  print("using resources")
end

local ok, err = pcall(function()
  local r <close> = make_resource("C")
  error("boom", 0)
end)
print(ok, err)

local LIMIT <const> = 10
print(LIMIT * 2)
