-- A stateless iterator keeps all state in the control variable
local function evenNumbers(max, current)
  current = current + 2
  if current <= max then return current end
end

for n in evenNumbers, 10, 0 do
  io.write(n, " ")
end
print()

local function reverseIter(list, i)
  i = i - 1
  if i >= 1 then return i, list[i] end
end

local function reversed(list)
  return reverseIter, list, #list + 1
end

for i, v in reversed({ "a", "b", "c" }) do
  print(i, v)
end

-- Sorted key traversal using a closure-based iterator
local function sortedPairs(t)
  local keys = {}
  for k in pairs(t) do keys[#keys + 1] = k end
  table.sort(keys)
  local i = 0
  return function()
    i = i + 1
    if keys[i] then return keys[i], t[keys[i]] end
  end
end

for k, v in sortedPairs({ pear = 3, apple = 1, fig = 2 }) do
  print(k, v)
end

local function chars(s)
  return function(str, i)
    i = i + 1
    if i <= #str then return i, str:sub(i, i) end
  end, s, 0
end
for i, c in chars("abc") do io.write(i, c, " ") end
print()
for k, v in next, { x = 1 } do print(k, v) end
