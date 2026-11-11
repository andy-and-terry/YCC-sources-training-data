-- Square of the sum minus sum of squares for 1..10 (expect 2640)
local sum, squares = 0, 0
for i = 1, 10 do
  sum = sum + i
  squares = squares + i * i
end
print(sum * sum - squares)
