-- Lua 5.2+ _ENV lets you run code with a restricted global table.

local function run_sandboxed(code, env)
  local chunk, err = load(code, "sandbox", "t", env)
  if not chunk then return nil, err end
  return pcall(chunk)
end

local safe_env = {
  print = print,
  math = { floor = math.floor, max = math.max },
}

print(run_sandboxed("print(math.floor(3.7)); return math.max(1, 9)", safe_env))

-- Anything not in the environment is nil
print(run_sandboxed("return os.time()", safe_env))

-- Globals created by the chunk land in the sandbox, not in _G
run_sandboxed("counter = 10", safe_env)
print(safe_env.counter, rawget(_G, "counter"))

-- _ENV can also be rebound as a local
local function with_env()
  local _ENV = { x = 5, y = 6 }
  return x * y
end
print(with_env())

-- A read-only proxy over the real globals
local ro = setmetatable({}, { __index = _G, __newindex = function() error("read only env", 2) end })
print(run_sandboxed("x = 1", ro))
