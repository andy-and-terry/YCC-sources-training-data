local function gen(n)
  return coroutine.wrap(function() for i = 1, n do coroutine.yield(i) end end)
end
local function filter(pred, g)
  return coroutine.wrap(function() for v in g do if pred(v) then coroutine.yield(v) end end end)
end
local function map(f, g)
  return coroutine.wrap(function() for v in g do coroutine.yield(f(v)) end end)
end
for v in map(function(x) return x * x end, filter(function(x) return x % 2 == 0 end, gen(10))) do io.write(v, " ") end
print()

local co = coroutine.create(function(a, b)
  local c = coroutine.yield(a + b)
  local d = coroutine.yield(c * 2)
  return "done", d
end)
print(coroutine.resume(co, 1, 2))
print(coroutine.resume(co, 10))
print(coroutine.resume(co, "x"))
print(coroutine.status(co), coroutine.resume(co))
