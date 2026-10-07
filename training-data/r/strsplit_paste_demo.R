sentence <- "the quick brown fox jumps"
words <- strsplit(sentence, " ")[[1]]
print(words)
print(length(words))

print(paste(rev(words), collapse = " "))
print(paste(toupper(substr(words, 1, 1)), substring(words, 2), sep = "", collapse = " "))

print(paste("item", 1:3, sep = "_"))
print(paste0("x", 1:3, collapse = "+"))
print(paste("a", c("b", "c"), "d"))

csv_line <- "name,age,,city"
print(strsplit(csv_line, ",")[[1]])
print(strsplit("a1b22c333", "[0-9]+")[[1]])
print(strsplit("abc", "")[[1]])

several <- strsplit(c("a-b", "c-d-e"), "-")
print(sapply(several, length))
print(sapply(several, `[`, 1))
print(unlist(lapply(several, tail, 1)))

print(nchar(words))
print(words[nchar(words) == max(nchar(words))])
print(sprintf("%-6s|%3d", words, nchar(words)))
print(trimws("  padded  "))
print(sprintf("%s has %d chars", sentence, nchar(sentence)))
print(rev(strsplit("racecar", NULL)[[1]]))
print(identical(paste(rev(strsplit("racecar", "")[[1]]), collapse = ""), "racecar"))
