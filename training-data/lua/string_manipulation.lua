local s = "Hello, Lua World!"

print(s:upper())
print(s:lower())
print(#s)
for word in s:gmatch("%a+") do print(word) end
print(s:gsub("World", "Programming"))
