local function make_readonly(source)
  local proxy = {}
  local mt = {
    __index = source,
    __newindex = function(_, key, _)
      error("attempt to modify read-only table, key: " .. tostring(key))
    end,
    __metatable = "protected",
  }
  return setmetatable(proxy, mt)
end

local config = make_readonly({ host = "localhost", port = 8080 })

print(config.host, config.port)
print(getmetatable(config))

local ok, err = pcall(function()
  config.port = 9090
end)
print(ok, err)
