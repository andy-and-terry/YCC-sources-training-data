local s = "hello world from lua"
print((s:gsub("(%w+)", string.upper)))
for w in s:gmatch("%a+") do io.write(#w, " ") end
print()
