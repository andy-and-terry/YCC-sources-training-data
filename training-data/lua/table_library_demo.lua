local t = { "a", "b", "c" }

table.insert(t, "d")
table.insert(t, 1, "start")
print(table.concat(t, ","))

print(table.remove(t))
print(table.remove(t, 1))
print(table.concat(t, ","), #t)

print(table.concat({ 1, 2, 3 }, " + ") .. " = " .. 6)
print(table.concat({}, ","), "|")
print(table.concat({ "x", "y", "z" }, "-", 2, 3))

local packed = table.pack(10, nil, 30)
print(packed.n, #packed)
print(table.unpack({ 1, 2, 3 }))
print(table.unpack({ 1, 2, 3, 4 }, 2, 3))

local moved = table.move({ 1, 2, 3 }, 1, 3, 3, { 9, 9 })
print(table.concat(moved, ","))

local nums = { 5, 2, 8, 1 }
table.sort(nums, function(a, b) return a > b end)
print(table.concat(nums, " "))

local function reverse(list)
  local r = {}
  for i = #list, 1, -1 do r[#r + 1] = list[i] end
  return r
end
print(table.concat(reverse({ 1, 2, 3 }), ""))
print(select("#", table.unpack({ 1, 2, 3 })))
print(next({}) == nil)
