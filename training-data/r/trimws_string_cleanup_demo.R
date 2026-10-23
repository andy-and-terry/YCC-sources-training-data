raw <- c("  Alice ", "bob\t", " CAROL  ", "")

clean <- trimws(raw)
print(clean)
print(trimws(raw, which = "left"))
print(trimws("xxhixx", whitespace = "x"))

print(nchar(raw))
print(nchar(clean))
print(toupper(clean))
print(tolower(clean))

cap <- function(s) paste0(toupper(substring(s, 1, 1)), tolower(substring(s, 2)))
print(cap(clean[clean != ""]))

print(startsWith(clean, "a"))
print(endsWith(clean, "b"))
print(sprintf("%-8s|", clean))
