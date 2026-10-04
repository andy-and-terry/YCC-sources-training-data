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
local function slowSquare(n)
  calls = calls + 1
  return n * n
end

local fast = memoize(slowSquare)
print(fast(9), fast(9), fast(9))
print("calls:", calls)

local fib
fib = memoize(function(n)
  if n < 2 then return n end
  return fib(n - 1) + fib(n - 2)
end)
print(fib(80))

local function memoizeMulti(fn)
  local cache = {}
  return function(...)
    local key = table.concat({ ... }, "\0")
    if cache[key] == nil then cache[key] = fn(...) end
    return cache[key]
  end
end

local add = memoizeMulti(function(a, b)
  print("computing", a, b)
  return a + b
end)
print(add(1, 2))
print(add(1, 2))
print(add(2, 1))
