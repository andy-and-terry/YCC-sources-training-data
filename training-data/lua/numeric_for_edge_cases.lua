for i = 10, 1, -3 do io.write(i, " ") end
print()
for i = 1, 0 do io.write("never ") end
print("empty loop ok")
for x = 0, 1, 0.25 do io.write(x, " ") end
print()
for i = math.maxinteger - 1, math.maxinteger do io.write(i, " ") end
print()
print(pcall(function() for i = 1, 10, 0 do end end))
