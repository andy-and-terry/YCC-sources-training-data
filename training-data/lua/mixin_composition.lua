local Serializable = {
  serialize = function(self)
    local keys = {}
    for k in pairs(self) do keys[#keys + 1] = k end
    table.sort(keys)
    local parts = {}
    for _, k in ipairs(keys) do parts[#parts + 1] = k .. "=" .. tostring(self[k]) end
    return "{" .. table.concat(parts, ",") .. "}"
  end,
}
local Comparable = {
  equals = function(a, b) return a:serialize() == b:serialize() end,
}

local function mixin(class, ...)
  for _, m in ipairs({ ... }) do
    for k, v in pairs(m) do class[k] = v end
  end
  return class
end

local Point = mixin({}, Serializable, Comparable)
Point.__index = Point

local p = setmetatable({ x = 1, y = 2 }, Point)
local q = setmetatable({ x = 1, y = 2 }, Point)
print(p:serialize(), p:equals(q))
