local function serialize(v, indent)
  indent = indent or ""
  local t = type(v)
  if t == "table" then
    local keys = {}
    for k in pairs(v) do keys[#keys + 1] = k end
    table.sort(keys, function(a, b) return tostring(a) < tostring(b) end)
    local parts = {}
    for _, k in ipairs(keys) do parts[#parts + 1] = string.format("%s=%s", tostring(k), serialize(v[k])) end
    return "{" .. table.concat(parts, ",") .. "}"
  elseif t == "string" then return string.format("%q", v)
  else return tostring(v) end
end
print(serialize({ name = "Ada", tags = { "a", "b" }, nested = { x = 1.5, ok = true } }))
local function deepcopy(o) if type(o) ~= "table" then return o end local c = {} for k, v in pairs(o) do c[deepcopy(k)] = deepcopy(v) end return setmetatable(c, getmetatable(o)) end
local orig = { a = { b = 1 } }
local cp = deepcopy(orig)
cp.a.b = 2
print(orig.a.b, cp.a.b)
