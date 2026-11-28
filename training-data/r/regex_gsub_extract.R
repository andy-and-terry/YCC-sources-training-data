s <- c("id=12", "id=345", "none")
print(sub(".*id=(\\d+).*", "\\1", s[grepl("id=", s)]))
print(regmatches(s, regexpr("[0-9]+", s)))
