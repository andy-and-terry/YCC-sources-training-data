local function sum(...)
  local total = 0
  for i = 1, select("#", ...) do
    total = total + (select(i, ...) or 0)
  end
  return total
end

local function pack_args(...)
  return { n = select("#", ...), ... }
end

local function tail(_, ...)
  return ...
end

print(sum(1, 2, 3, 4))
local p = pack_args("a", nil, "c")
print(p.n, p[1], p[2], p[3])
print(tail(10, 20, 30))
print(select(-1, "x", "y", "z"))
print(table.unpack({ 1, 2, 3 }, 2))
print((select("#")))
