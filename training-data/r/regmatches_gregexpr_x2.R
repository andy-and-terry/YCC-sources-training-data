s <- "a1b22c333"
print(regmatches(s, gregexpr("[0-9]+", s))[[1]])
