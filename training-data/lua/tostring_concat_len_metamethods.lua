local Stack = {}
Stack.__index = Stack

Stack.__len = function(s) return s.n end

Stack.__tostring = function(s)
  local parts = {}
  for i = 1, s.n do parts[i] = tostring(s.items[i]) end
  return "Stack[" .. table.concat(parts, ",") .. "]"
end

Stack.__concat = function(a, b)
  if type(a) == "string" then return a .. tostring(b) end
  if type(b) == "string" then return tostring(a) .. b end
  local r = Stack.new()
  for i = 1, a.n do r:push(a.items[i]) end
  for i = 1, b.n do r:push(b.items[i]) end
  return r
end

Stack.__call = function(s, v)
  s:push(v)
  return s
end

Stack.__unm = function(s)
  local r = Stack.new()
  for i = s.n, 1, -1 do r:push(s.items[i]) end
  return r
end

function Stack.new() return setmetatable({ n = 0, items = {} }, Stack) end

function Stack:push(v)
  self.n = self.n + 1
  self.items[self.n] = v
end

local s = Stack.new()
s(1)(2)(3)
print(#s, tostring(s))
print("stack is " .. s)
print(s .. Stack.new())
print(-s)
print(tostring(s .. -s))
