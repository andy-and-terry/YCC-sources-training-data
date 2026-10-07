# sort() returns values; order() returns positions, which lets you
# sort one structure by another.
x <- c(30, 10, 20)
print(sort(x, decreasing = TRUE))
print(order(x))

people <- data.frame(
  name = c("Cy", "Ann", "Bo", "Di"),
  dept = c("ops", "dev", "dev", "ops"),
  pay  = c(50, 70, 65, 55)
)

print(people[order(people$pay), ])
print(people[order(people$dept, -people$pay), ])
print(rank(c(10, 30, 20, 20)))
print(rev(sort(c(b = 2, a = 1, c = 3))))
