lens <- vapply(c("apple", "fig", "banana"), nchar, integer(1))
print(lens)

sums <- mapply(function(a, b) a + b, 1:3, 4:6)
print(sums)

reps <- mapply(rep, 1:3, 3:1)
print(reps)

print(Reduce(`+`, 1:5, accumulate = TRUE))
