local s = "hello world from lua"
print((s:gsub("%w+", string.upper)))
for w in s:gmatch("%a+") do io.write(w:sub(1, 1), " ") end
print()
print(s:find("world"))
