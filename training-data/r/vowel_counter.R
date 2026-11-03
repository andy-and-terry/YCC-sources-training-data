count_vowels <- function(s) {
  chars <- strsplit(tolower(s), "")[[1]]
  sapply(c("a", "e", "i", "o", "u"), function(v) sum(chars == v))
}

print(count_vowels("Education is beautiful"))
