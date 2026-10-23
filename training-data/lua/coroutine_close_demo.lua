local co = coroutine.create(function()
  local res <close> = setmetatable({}, {
    __close = function() print("resource released") end,
  })
  coroutine.yield(1)
  print("never reached")
end)

print(coroutine.resume(co))
print(coroutine.status(co))
print(coroutine.close(co))
print(coroutine.status(co))

local failing = coroutine.create(function() error("bad") end)
coroutine.resume(failing)
local ok, err = coroutine.close(failing)
print(ok, err)
