local s = "key1=val1; key2=val2"
for k, v in s:gmatch("(%w+)=(%w+)") do print(k, v) end
print((s:gsub("%d", "#")))
print(("  trim me  "):match("^%s*(.-)%s*$"))
