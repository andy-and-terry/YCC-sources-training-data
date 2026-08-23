local LRUCache = {}
LRUCache.__index = LRUCache

function LRUCache.new(capacity)
  local self = setmetatable({}, LRUCache)
  self.capacity = capacity
  self.map = {}
  self.order = {}
  return self
end

function LRUCache:get(key)
  if self.map[key] then
    for i, k in ipairs(self.order) do
      if k == key then table.remove(self.order, i); break end
    end
    table.insert(self.order, key)
    return self.map[key]
  end
  return nil
end

function LRUCache:put(key, value)
  if self.map[key] then
    for i, k in ipairs(self.order) do
      if k == key then table.remove(self.order, i); break end
    end
  end
  self.map[key] = value
  table.insert(self.order, key)
  if #self.order > self.capacity then
    local evict = table.remove(self.order, 1)
    self.map[evict] = nil
  end
end

local cache = LRUCache.new(2)
cache:put(1, "a")
cache:put(2, "b")
print(cache:get(1))
cache:put(3, "c")
print(cache:get(2))
