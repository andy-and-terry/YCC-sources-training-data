local s = "key1=val1; key2=val2"
for k, v in s:gmatch("(%w+)=(%w+)") do print(k, v) end
print(("hello world"):gsub("o", "0"))
print(("  trim me  "):match("^%s*(.-)%s*$"))
print(string.format("%5.1f|%-5s|%x", 3.14159, "ab", 255))
