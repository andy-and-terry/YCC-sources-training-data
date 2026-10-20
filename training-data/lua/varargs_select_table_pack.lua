local function sum(...)
  local s = 0
  for _, v in ipairs({ ... }) do s = s + v end
  return s, select("#", ...)
end
print(sum(1, 2, 3))
print(select(2, "a", "b", "c"))
print(select(-1, "a", "b", "c"))
local packed = table.pack(1, nil, 3)
print(packed.n, #packed)
print(table.unpack({ 1, 2, 3 }, 2))
local function first_and_rest(first, ...) return first, { ... } end
local f, r = first_and_rest(1, 2, 3)
print(f, #r)
print((function(...) return select("#", ...) end)(nil, nil))
print(math.max(table.unpack({ 4, 9, 2 })))
