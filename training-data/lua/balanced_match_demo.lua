-- %b matches balanced pairs of delimiters
local s = "f(a, g(b, c), d) + h(e)"
for call in s:gmatch("%a%b()") do
  print(call)
end
print(("{ { } }"):match("%b{}"))
