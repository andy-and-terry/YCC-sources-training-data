print(Reduce(`+`, 1:5, accumulate = TRUE))
print(Filter(function(x) x %% 2 == 0, 1:10))
print(Map(function(a, b) a * b, 1:3, 4:6))
print(do.call(rbind, list(1:2, 3:4)))
