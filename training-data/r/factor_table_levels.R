f <- factor(c("lo", "hi", "mid", "hi", "lo", "hi"), levels = c("lo", "mid", "hi"))
print(table(f))
print(as.integer(f))
print(levels(f))
