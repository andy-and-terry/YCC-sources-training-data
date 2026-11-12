print(paste("a", "b", sep = "-"))
print(sprintf("%05.1f|%s", 3.14159, "x"))
print(gsub("[aeiou]", "", "education"))
print(regmatches("a1b22c333", gregexpr("[0-9]+", "a1b22c333"))[[1]])
