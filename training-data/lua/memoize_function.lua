-- Generic memoization using a cache table; multi-argument keys are joined.
local function memoize(fn)
  local cache = {}
  return function(...)
    local key = table.concat({ ... }, "\0")
    local hit = cache[key]
    if hit == nil then
      hit = fn(...)
      cache[key] = hit
    end
    return hit
  end
end

local calls = 0
local slow_square = memoize(function(x)
  calls = calls + 1
  return x * x
end)
print(slow_square(4), slow_square(4), slow_square(5), calls)

local fib
fib = memoize(function(n)
  if n < 2 then return n end
  return fib(n - 1) + fib(n - 2)
end)
print(fib(80))

local grid_calls = 0
local paths
paths = memoize(function(r, c)
  grid_calls = grid_calls + 1
  if r == 1 or c == 1 then return 1 end
  return paths(r - 1, c) + paths(r, c - 1)
end)
print(paths(10, 10), grid_calls)
