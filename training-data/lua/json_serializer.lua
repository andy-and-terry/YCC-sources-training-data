local function is_array(t)
  local count = 0
  for _ in pairs(t) do count = count + 1 end
  return count == #t
end

local function serialize(value)
  local t = type(value)
  if t == "nil" then
    return "null"
  elseif t == "number" or t == "boolean" then
    return tostring(value)
  elseif t == "string" then
    return "\"" .. value:gsub("\"", "\\\"") .. "\""
  elseif t == "table" then
    if is_array(value) then
      local parts = {}
      for _, v in ipairs(value) do
        table.insert(parts, serialize(v))
      end
      return "[" .. table.concat(parts, ",") .. "]"
    else
      local parts = {}
      for k, v in pairs(value) do
        table.insert(parts, "\"" .. tostring(k) .. "\":" .. serialize(v))
      end
      return "{" .. table.concat(parts, ",") .. "}"
    end
  end
  return "null"
end

local data = { name = "Ada", age = 36, active = true, tags = { "math", "computing" } }
print(serialize(data))
print(serialize({ 1, 2, 3 }))
