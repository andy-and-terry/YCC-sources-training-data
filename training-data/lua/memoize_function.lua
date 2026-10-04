local function memoize(fn)
  local cache = {}
  return function(n)
    local hit = cache[n]
    if hit == nil then
      hit = fn(n)
      cache[n] = hit
    end
    return hit
  end
end

local calls = 0
local slow_square = memoize(function(n)
  calls = calls + 1
  return n * n
end)

print(slow_square(9), slow_square(9), slow_square(4))
print("underlying calls:", calls)

local fib
fib = memoize(function(n)
  if n < 2 then
    return n
  end
  return fib(n - 1) + fib(n - 2)
end)
print(fib(80))

-- auto-filling table via __index
local collatz_len = setmetatable({ [1] = 1 }, {
  __index = function(t, n)
    local nxt = (n % 2 == 0) and n // 2 or 3 * n + 1
    local v = t[nxt] + 1
    rawset(t, n, v)
    return v
  end,
})
print(collatz_len[27], collatz_len[97])

-- weak cache so entries can be collected
local weak = setmetatable({}, { __mode = "k" })
local key = {}
weak[key] = "value"
print(weak[key])
