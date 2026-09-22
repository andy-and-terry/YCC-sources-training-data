local function inner(x)
  if x < 0 then
    error("negative input: " .. x)
  end
  return x * 2
end

local function outer(x)
  return inner(x) + 1
end

local function handler(err)
  return "handled: " .. tostring(err) .. "\n" .. debug.traceback("", 2)
end

local ok, result = xpcall(outer, handler, 5)
print(ok, result)

local ok2, result2 = xpcall(outer, handler, -3)
print(ok2)
print(result2)
