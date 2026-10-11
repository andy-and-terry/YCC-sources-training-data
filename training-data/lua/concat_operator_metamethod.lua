local Str = {}
Str.__index = Str
Str.__concat = function(a, b)
  local av = type(a) == "table" and a.s or tostring(a)
  local bv = type(b) == "table" and b.s or tostring(b)
  return setmetatable({ s = av .. bv }, Str)
end
Str.__len = function(self) return #self.s end
Str.__tostring = function(self) return self.s end

local function S(s) return setmetatable({ s = s }, Str) end

local r = S("foo") .. "bar" .. 42
print(tostring(r), #r)
