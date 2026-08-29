normalize_str <- function(s) {
  chars <- strsplit(gsub(" ", "", tolower(s)), "")[[1]]
  paste(sort(chars), collapse = "")
}

is_anagram <- function(a, b) {
  normalize_str(a) == normalize_str(b)
}

print(is_anagram("listen", "silent"))
print(is_anagram("hello", "world"))
