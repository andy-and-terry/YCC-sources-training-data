local parts = {}
for i = 1, 5 do parts[#parts + 1] = "item" .. i end
print(table.concat(parts, ", "))
print(("x"):rep(3, "-"))
print(#"héllo", utf8.len("héllo"))
