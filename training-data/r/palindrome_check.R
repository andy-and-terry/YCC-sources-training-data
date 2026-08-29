is_palindrome <- function(s) {
  normalized <- tolower(gsub("[^a-zA-Z0-9]", "", s))
  reversed <- paste(rev(strsplit(normalized, "")[[1]]), collapse = "")
  normalized == reversed
}

print(is_palindrome("A man, a plan, a canal: Panama"))
print(is_palindrome("hello"))
