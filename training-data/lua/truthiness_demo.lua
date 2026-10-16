local values = { false, true, 0, "", {}, "false" }
for i, v in ipairs(values) do
  print(i, tostring(v), v and "truthy" or "falsy")
end
print(nil and 1, nil or 2, false or nil, 0 and "zero is true")
print(not nil, not 0)
local default = nil
local x = default or "fallback"
print(x)
