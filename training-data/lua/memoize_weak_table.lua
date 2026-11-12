local cache = setmetatable({}, { __mode = "k" })
local function memo(f)
  return function(x)
    if cache[x] == nil then cache[x] = f(x) end
    return cache[x]
  end
end
local sq = memo(function(x) print("calc"); return x * x end)
print(sq(4), sq(4))
