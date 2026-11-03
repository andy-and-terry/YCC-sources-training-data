local counts = { a = 0, e = 0, i = 0, o = 0, u = 0 }
for c in ("Education is beautiful"):lower():gmatch("[aeiou]") do
  counts[c] = counts[c] + 1
end
for _, v in ipairs({ "a", "e", "i", "o", "u" }) do
  io.write(v, "=", counts[v], " ")
end
print()
