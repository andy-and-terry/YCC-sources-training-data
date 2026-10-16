stats <- vapply(split(mtcars$mpg, mtcars$cyl),
                function(v) c(mean = mean(v), sd = sd(v), n = length(v)),
                numeric(3))
print(round(stats, 2))
print(dim(stats))
print(round(stats["mean", ], 1))

words <- c("apple", "kiwi", "banana")
lens <- vapply(words, nchar, integer(1))
print(lens)
print(vapply(words, function(w) substr(w, 1, 1), character(1), USE.NAMES = FALSE))
res <- tryCatch(vapply(1:2, function(i) "a", numeric(1)), error = function(e) "type mismatch")
print(res)
print(mapply(rep, 1:3, 3:1))
print(sapply(1:3, function(i) letters[i]))
print(array(1:8, c(2, 2, 2))[2, 2, 2])
print(outer(1:2, 1:3, "+"))
