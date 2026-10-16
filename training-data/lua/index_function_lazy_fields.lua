local calls = 0
local lazy = setmetatable({}, {
  __index = function(t, k)
    calls = calls + 1
    local v = k:upper() .. "!"
    rawset(t, k, v) -- cache so __index only runs once per key
    return v
  end,
})

print(lazy.foo, lazy.foo, lazy.bar)
print(calls)
print(rawget(lazy, "baz"))
