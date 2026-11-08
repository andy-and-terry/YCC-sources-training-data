local function memoize(f)
  local cache = {}
  return function(n)
    if cache[n] == nil then cache[n] = f(n) end
    return cache[n]
  end
end

local fib
fib = memoize(function(n) return n < 2 and n or fib(n - 1) + fib(n - 2) end)
print(fib(50))
