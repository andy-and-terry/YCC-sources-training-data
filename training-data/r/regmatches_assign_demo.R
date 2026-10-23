# Replacing matched pieces in place with `regmatches<-`
x <- c("order 12 and 7", "no digits", "item 5")

m <- regexpr("[0-9]+", x)
print(regmatches(x, m))

# Replace only the first number in each string
y <- x
regmatches(y, m) <- rep("N", sum(m > 0))
print(y)

# Replace every number using gregexpr, one replacement vector per element
g <- gregexpr("[0-9]+", x)
z <- x
regmatches(z, g) <- lapply(regmatches(x, g), function(nums) {
  as.character(as.integer(nums) * 10L)
})
print(z)

# Compare with sub/gsub for simple cases
print(gsub("[0-9]+", "#", x))
