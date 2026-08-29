is_valid <- function(s) {
  stack <- c()
  pairs <- c(")" = "(", "]" = "[", "}" = "{")
  chars <- strsplit(s, "")[[1]]
  for (c in chars) {
    if (c %in% c("(", "[", "{")) {
      stack <- c(stack, c)
    } else if (c %in% c(")", "]", "}")) {
      if (length(stack) == 0 || stack[length(stack)] != pairs[c]) {
        return(FALSE)
      }
      stack <- stack[-length(stack)]
    }
  }
  length(stack) == 0
}

print(is_valid("{[()]}"))
print(is_valid("{[(])}"))
