local Version = {}
Version.__index = Version

local function new(major, minor)
  return setmetatable({ major = major, minor = minor }, Version)
end

Version.__eq = function(a, b) return a.major == b.major and a.minor == b.minor end
Version.__lt = function(a, b)
  return a.major < b.major or (a.major == b.major and a.minor < b.minor)
end
Version.__le = function(a, b) return not (b < a) end
Version.__tostring = function(v) return v.major .. "." .. v.minor end

local a, b = new(1, 2), new(1, 10)
print(tostring(a), tostring(b))
print(a < b, a <= b, a > b, a == new(1, 2), a ~= b)
