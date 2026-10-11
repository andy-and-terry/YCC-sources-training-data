local t = { 10, 20, 30, 40, 50 }
print(table.concat(t))
print(table.concat(t, "-"))
print(table.concat(t, ",", 2, 4))
print(table.concat({}, ","))
print(table.concat({ "a", 1, 2.5 }, " "))
print(pcall(table.concat, { {}, 1 }, ","))
