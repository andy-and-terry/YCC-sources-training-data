local t = { "a", "b", "c" }

table.insert(t, "d")
table.insert(t, 1, "z")
print(table.concat(t, ","))

print(table.remove(t))
print(table.remove(t, 1))
print(table.concat(t, ","))

print(table.concat({ 1, 2, 3 }, " + ", 2, 3))
print(table.unpack({ 10, 20, 30 }))
print(table.unpack({ 10, 20, 30 }, 2))

local packed = table.pack("x", nil, "z")
print(packed.n, packed[1], packed[2], packed[3])

local moved = table.move({ 1, 2, 3 }, 1, 3, 2)
print(table.concat(moved, ","))

local copy = table.move({ 1, 2, 3 }, 1, 3, 1, {})
print(table.concat(copy, ","))

local words = { "banana", "Apple", "cherry" }
table.sort(words)
print(table.concat(words, " "))
table.sort(words, function(a, b) return a:lower() < b:lower() end)
print(table.concat(words, " "))

print(select("#", table.unpack({}, 1, 3)))
print(#"abc", #{ 1, 2, 3, nil })
