io.write("a", 1, 2.5, "\n")
local out = io.stdout
out:write("chained "):write("writes "):write("work\n")
io.stderr:write("")
print(io.type(out), io.type(42))
local f = io.tmpfile()
f:write("line1\nline2\nline3\n")
f:seek("set")
for line in f:lines() do io.write("[", line, "]") end
print()
f:close()
print(io.type(f))
