numbers <- 1:10

evens <- Filter(function(x) x %% 2 == 0, numbers)
print(evens)

squares <- unlist(Map(function(x) x^2, evens))
print(squares)

total <- Reduce(`+`, numbers)
print(total)

running_max <- Reduce(function(acc, x) max(acc, x), c(3, 7, 2, 9, 4), accumulate = TRUE)
print(running_max)
