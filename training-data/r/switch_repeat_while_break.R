f <- function(x) switch(x, a = "first", b = "second", "other")
print(c(f("a"), f("b"), f("z")))
i <- 0
repeat { i <- i + 1; if (i >= 3) break }
print(i)
