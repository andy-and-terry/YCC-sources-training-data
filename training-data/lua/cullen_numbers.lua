local out = {}
for n = 0, 9 do
  out[#out + 1] = n * (1 << n) + 1
end
print(table.concat(out, " "))
