-- Weak tables let entries be garbage collected once nothing else references
-- the key (or value), which makes them a natural fit for caches that
-- shouldn't keep otherwise-dead objects alive.
local cache = setmetatable({}, { __mode = "k" })

local function memoizedLabel(obj, compute)
  local cached = cache[obj]
  if cached == nil then
    cached = compute(obj)
    cache[obj] = cached
  end
  return cached
end

local function makeKey(name)
  return { name = name }
end

local key1 = makeKey("alice")
local calls = 0
local label = memoizedLabel(key1, function(obj)
  calls = calls + 1
  return "user:" .. obj.name
end)
print(label, calls)

-- Calling again with the same table reference hits the cache.
label = memoizedLabel(key1, function(obj)
  calls = calls + 1
  return "user:" .. obj.name
end)
print(label, calls)

key1 = nil
collectgarbage("collect")

local count = 0
for _ in pairs(cache) do
  count = count + 1
end
print("entries after gc:", count)
