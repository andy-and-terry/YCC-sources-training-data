-- %f is the frontier pattern: matches a transition between character sets
local text = "THE (QUICK) fox"
for word in text:gmatch("%f[%a]%a+%f[%A]") do
  io.write(word, "|")
end
print()

print(("hello world"):find("o w", 1, true))
print(("a.b.c"):gsub("%.", "/"))
print(("key = value"):match("^(%w+)%s*=%s*(%w+)$"))
print(("[[nested]]"):match("%[%[(.-)%]%]"))
