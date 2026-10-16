var sb = newStringOfCap(64)
for i in 1 .. 5:
  sb.add $i
  if i < 5: sb.add ", "
echo sb
sb.setLen(0)
sb.add 'x'
sb &= "yz"
echo sb, " ", sb.len
sb.insert("--", 1)
echo sb
echo sb[0], sb[^1]
