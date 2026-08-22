numbers <- 1:10
even_squares <- sapply(Filter(function(n) n %% 2 == 0, numbers), function(n) n^2)
total <- Reduce(`+`, numbers)

print(even_squares)
print(total)
