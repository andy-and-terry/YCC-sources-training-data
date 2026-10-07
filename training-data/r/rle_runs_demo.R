# rle() describes runs of repeated values; inverse.rle() rebuilds them.
bits <- c(1, 1, 0, 0, 0, 1, 0, 0)
runs <- rle(bits)
print(runs)
print(runs$lengths)
print(runs$values)

longest <- max(runs$lengths[runs$values == 0])
print(longest)

print(inverse.rle(runs))

s <- strsplit("aaabccdddd", "")[[1]]
r <- rle(s)
print(paste0(r$values, r$lengths, collapse = ""))
