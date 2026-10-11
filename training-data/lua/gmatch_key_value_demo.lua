local config = "host=localhost; port=8080; mode=debug"
local result = {}
for key, value in config:gmatch("(%w+)=(%w+)") do
  result[key] = value
end

local keys = {}
for k in pairs(result) do keys[#keys + 1] = k end
table.sort(keys)
for _, k in ipairs(keys) do
  print(k, result[k])
end
