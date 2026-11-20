# Remove consecutive duplicates with rle.
s <- strsplit("aabbbcdd", "")[[1]]
cat(rle(s)$values, sep = "", "\n")
