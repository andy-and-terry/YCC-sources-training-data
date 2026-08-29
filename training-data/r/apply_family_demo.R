numbers <- 1:5

print(sapply(numbers, function(x) x^2))
print(lapply(numbers, function(x) x * 2))
print(Map(function(x, y) x + y, 1:3, 4:6))
