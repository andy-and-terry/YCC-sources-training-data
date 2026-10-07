name <- "Ada"
score <- 93.456
cat(sprintf("%s scored %.1f\n", name, score))
cat(sprintf("%5d|%-5d|%05d\n", 42L, 42L, 42L))
cat(sprintf("%e %g %%\n", 12345.678, 0.00001234))
cat(sprintf("%s has %d items\n", c("A", "B"), c(1L, 2L)), sep = "")

print(paste("a", "b", "c", sep = "-"))
print(paste0("id", 1:3))
print(paste(c("x", "y"), collapse = "+"))
print(toupper("shout"))
print(nchar(c("one", "three")))
print(substr("abcdef", 2, 4))
print(strsplit("a,b,c", ",")[[1]])
print(format(1234567.891, big.mark = ",", nsmall = 2))
print(format(Sys.Date(), "%Y") >= "2024")
print(trimws("  hi  "))
print(rev(strsplit("hello", "")[[1]]))
print(formatC(3.14159, digits = 3, format = "f", width = 10))
