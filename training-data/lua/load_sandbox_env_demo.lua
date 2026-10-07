local function run(code, env)
  local chunk, err = load(code, "=sandbox", "t", env)
  if not chunk then
    return nil, "compile error: " .. err
  end
  local ok, result = pcall(chunk)
  if not ok then
    return nil, "runtime error: " .. tostring(result)
  end
  return result
end

local safeEnv = {
  print = print,
  math = { floor = math.floor, max = math.max },
  tostring = tostring,
}

print(run("return 1 + 2 * 3", safeEnv))
print(run("return math.max(4, 9)", safeEnv))
print(run("return os.time()", safeEnv))
print(run("return (", safeEnv))
print(run("x = 5; return x * 2", safeEnv))
print(safeEnv.x)

local parts = { "return ", "10", " + 5" }
local i = 0
local fn = load(function()
  i = i + 1
  return parts[i]
end)
print(fn())

local function evaluate(expr)
  local f = load("return " .. expr, "=expr", "t", {})
  return f and select(2, pcall(f))
end
print(evaluate("2^8"))
print(evaluate("1 +"))
