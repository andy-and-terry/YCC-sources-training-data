print(("hello world"):gsub("o", "0"))
print(("hello world"):gsub("(%w+)", "<%1>"))
print(("abc"):gsub("%w", { a = "1", b = "2" }))
print(("x=1, y=2"):gsub("(%w+)=(%w+)", "%2=%1"))
print(("  trim  "):match("^%s*(.-)%s*$") .. "|")
for k, v in string.gmatch("a=1, b=2", "(%w+)=(%w+)") do
  print(k, v)
end
print(("2024-05-17"):match("(%d+)-(%d+)-(%d+)"))
