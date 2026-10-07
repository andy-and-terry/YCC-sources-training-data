-- A minimal hash table built from a plain array, resolving collisions
-- with linear probing instead of relying on Lua's built-in tables.
local HashTable = {}
HashTable.__index = HashTable

local TOMBSTONE = {}

function HashTable.new(capacity)
  return setmetatable({
    capacity = capacity,
    slots = {},
    keys = {},
    count = 0,
  }, HashTable)
end

local function hash(key, capacity)
  local sum = 0
  for i = 1, #key do
    sum = (sum * 31 + key:byte(i)) % capacity
  end
  return sum + 1
end

function HashTable:put(key, value)
  local index = hash(key, self.capacity)
  for _ = 1, self.capacity do
    if self.keys[index] == nil or self.keys[index] == key then
      if self.keys[index] == nil then self.count = self.count + 1 end
      self.keys[index] = key
      self.slots[index] = value
      return
    end
    index = (index % self.capacity) + 1
  end
  error("hash table is full")
end

function HashTable:get(key)
  local index = hash(key, self.capacity)
  for _ = 1, self.capacity do
    if self.keys[index] == key then
      return self.slots[index]
    end
    if self.keys[index] == nil then return nil end
    index = (index % self.capacity) + 1
  end
  return nil
end

function HashTable:remove(key)
  local index = hash(key, self.capacity)
  for _ = 1, self.capacity do
    if self.keys[index] == key then
      self.keys[index] = TOMBSTONE
      self.slots[index] = nil
      self.count = self.count - 1
      return true
    end
    if self.keys[index] == nil then return false end
    index = (index % self.capacity) + 1
  end
  return false
end

local t = HashTable.new(8)
t:put("apple", 1)
t:put("banana", 2)
t:put("cherry", 3)

print(t:get("banana"))
t:remove("banana")
print(t:get("banana"))
print(t:get("cherry"))
print("count:", t.count)
