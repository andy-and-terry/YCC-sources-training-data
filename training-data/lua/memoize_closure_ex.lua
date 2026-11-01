local function memoize(f)
  local cache = {}
  return function(n)
    local v = cache[n]
    if v == nil then v = f(n); cache[n] = v end
    return v
  end
end
local fib
fib = memoize(function(n) if n < 2 then return n end return fib(n - 1) + fib(n - 2) end)
print(fib(50))
