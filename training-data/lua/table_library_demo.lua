local t = { 10, 20, 30 }
table.insert(t, 40)
table.insert(t, 1, 5)
print(table.concat(t, ", "))

print(table.remove(t))
print(table.remove(t, 1))
print(table.concat(t, ", "))

print(table.unpack({ 1, 2, 3 }))
print(select("#", table.unpack({ 1, nil, 3 }, 1, 3)))

local packed = table.pack("a", nil, "c")
print(packed.n, #packed)

local moved = table.move({ 1, 2, 3 }, 1, 3, 3, { 9, 9 })
print(table.concat(moved, ","))

local copy = table.move(t, 1, #t, 1, {})
copy[1] = 999
print(t[1], copy[1])

local words = { "pear", "apple", "fig" }
table.sort(words)
print(table.concat(words, " "))
table.sort(words, function(a, b) return #a < #b end)
print(table.concat(words, " "))

print(#{ n = 1 }, next({}) == nil)
print(table.concat({}, ","), table.concat({ 1, 2, 3 }, "-", 2, 3))
