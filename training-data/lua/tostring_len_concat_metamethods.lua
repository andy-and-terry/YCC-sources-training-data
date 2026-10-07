local Stack = {}
Stack.__index = Stack

function Stack.new() return setmetatable({ items = {}, n = 0 }, Stack) end
function Stack:push(v) self.n = self.n + 1; self.items[self.n] = v; return self end

Stack.__len = function(s) return s.n end
Stack.__tostring = function(s)
  local parts = {}
  for i = 1, s.n do parts[i] = tostring(s.items[i]) end
  return "Stack[" .. table.concat(parts, ", ") .. "]"
end
Stack.__concat = function(a, b)
  if getmetatable(a) == Stack then
    for i = 1, b.n do a:push(b.items[i]) end
    return a
  end
  return tostring(a) .. tostring(b)
end
Stack.__eq = function(a, b)
  if a.n ~= b.n then return false end
  for i = 1, a.n do if a.items[i] ~= b.items[i] then return false end end
  return true
end
Stack.__lt = function(a, b) return a.n < b.n end
Stack.__le = function(a, b) return a.n <= b.n end
Stack.__unm = function(s)
  local r = Stack.new()
  for i = s.n, 1, -1 do r:push(s.items[i]) end
  return r
end

local a = Stack.new():push(1):push(2)
local b = Stack.new():push(3)
print(#a, tostring(a))
print(tostring(a .. b))
print("size: " .. #a)
print(a == Stack.new():push(1):push(2):push(3), a < b, b <= a)
print(tostring(-a))
