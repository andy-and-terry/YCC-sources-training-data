-- Double-ended queue with first/last indices: O(1) at both ends.
local Deque = {}
Deque.__index = Deque

function Deque.new() return setmetatable({ first = 0, last = -1, items = {} }, Deque) end

function Deque:push_front(v)
  self.first = self.first - 1
  self.items[self.first] = v
end

function Deque:push_back(v)
  self.last = self.last + 1
  self.items[self.last] = v
end

function Deque:pop_front()
  if self.first > self.last then return nil end
  local v = self.items[self.first]
  self.items[self.first] = nil
  self.first = self.first + 1
  return v
end

function Deque:pop_back()
  if self.first > self.last then return nil end
  local v = self.items[self.last]
  self.items[self.last] = nil
  self.last = self.last - 1
  return v
end

function Deque:size() return self.last - self.first + 1 end

local d = Deque.new()
d:push_back(2); d:push_back(3); d:push_front(1); d:push_front(0)
print(d:size(), d:pop_front(), d:pop_back(), d:size())
print(d:pop_front(), d:pop_front(), d:pop_front())

-- palindrome check using the deque
local function is_palindrome(s)
  local q = Deque.new()
  for ch in s:gmatch("%a") do q:push_back(ch:lower()) end
  while q:size() > 1 do
    if q:pop_front() ~= q:pop_back() then return false end
  end
  return true
end
print(is_palindrome("A man, a plan, a canal: Panama"), is_palindrome("hello"))
