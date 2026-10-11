local a = { 1, 2, 3, 4, 5 }
local b = table.move(a, 2, 4, 1, {})
print(table.concat(b, ","))

-- shift elements right within the same table
table.move(a, 1, 3, 3)
print(table.concat(a, ","))

local joined = table.move({ 7, 8 }, 1, 2, 4, { 1, 2, 3 })
print(table.concat(joined, ","))
