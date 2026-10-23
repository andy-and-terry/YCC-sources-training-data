local out = {}
for n = 1, 10 do
  out[#out + 1] = n * (1 << n) - 1
end
print(table.concat(out, " "))
