local t = { "b", "c" }
table.insert(t, "d")
table.insert(t, 1, "a")
print(table.concat(t, ""))

print(table.remove(t, 2))
print(table.remove(t))
print(table.concat(t, ""))
print(table.remove({}))
print(select("#", table.unpack({ 1, nil, 3 }, 1, 3)))
