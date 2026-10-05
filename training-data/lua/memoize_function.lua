local function memoize(fn)
  local cache = {}
  return function(n)
    local v = cache[n]
    if v == nil then
      v = fn(n)
      cache[n] = v
    end
    return v
  end
end

local calls = 0
local fib
fib = memoize(function(n)
  calls = calls + 1
  if n < 2 then return n end
  return fib(n - 1) + fib(n - 2)
end)

print(fib(50))
print("calls:", calls)

local weak = setmetatable({}, { __mode = "k" })
local key = {}
weak[key] = "value"
print(weak[key])
