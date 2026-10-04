local function count(...)
  return select("#", ...)
end

local function sum(...)
  local total = 0
  for i = 1, select("#", ...) do
    total = total + (select(i, ...) or 0)
  end
  return total
end

print(count(), count(nil, nil), count(1, 2, 3))
print(sum(1, 2, 3, 4))
print(select(2, "a", "b", "c"))
print(select(-1, "a", "b", "c"))

local packed = table.pack(1, nil, 3)
print(packed.n, #packed)
print(table.unpack({ 10, 20, 30 }, 2))
