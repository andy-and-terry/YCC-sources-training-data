local function timeit(f, ...)
  local start = os.clock()
  local r = f(...)
  return r, os.clock() - start
end

local function sumTo(n)
  local s = 0
  for i = 1, n do s = s + i end
  return s
end

local result, elapsed = timeit(sumTo, 1000000)
print(result, elapsed >= 0)
print(os.time({ year = 2020, month = 1, day = 1, hour = 12 }) > 0)
print(os.getenv("NONEXISTENT_VAR_XYZ"))
