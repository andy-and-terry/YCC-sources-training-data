print(Reduce(`+`, 1:5, accumulate = TRUE))
print(Filter(function(x) x %% 2 == 0, 1:10))
print(do.call(rbind, lapply(1:3, function(i) c(i, i^2))))
