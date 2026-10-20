local cache = setmetatable({}, { __mode = "v" })
cache.a = { 1, 2, 3 }
cache.b = "string stays"
collectgarbage()
print(cache.a == nil, cache.b)
local keys = setmetatable({}, { __mode = "k" })
do local obj = {}; keys[obj] = "meta" end
collectgarbage()
local n = 0 for _ in pairs(keys) do n = n + 1 end
print(n)
local before = collectgarbage("count")
local junk = {} for i = 1, 10000 do junk[i] = { i } end
print(collectgarbage("count") > before)
junk = nil
collectgarbage()
local closed = false
do local x <close> = setmetatable({}, { __close = function() closed = true end }) end
print(closed)
local K <const> = 5
print(K)
