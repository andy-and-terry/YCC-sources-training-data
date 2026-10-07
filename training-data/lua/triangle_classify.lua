local function classify(a, b, c)
  local s = { a, b, c }
  table.sort(s)
  if s[1] <= 0 or s[1] + s[2] <= s[3] then return "invalid" end
  if a == b and b == c then return "equilateral" end
  if a == b or b == c or a == c then return "isosceles" end
  return "scalene"
end

print(classify(3, 3, 3), classify(3, 4, 4), classify(3, 4, 5), classify(1, 1, 3))
