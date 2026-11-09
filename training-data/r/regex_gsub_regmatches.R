s <- "order 123 and 45"
print(gsub("[0-9]+", "N", s))
print(regmatches(s, gregexpr("[0-9]+", s))[[1]])
print(grepl("^order", s))
print(toupper(substr(s, 1, 1)))
