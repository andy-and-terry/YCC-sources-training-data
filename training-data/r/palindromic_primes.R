is_prime <- function(n) n >= 2 && all(n %% seq_len(max(1, floor(sqrt(n))))[-1] != 0)

is_palindrome <- function(n) {
  s <- as.character(n)
  s == paste(rev(strsplit(s, "")[[1]]), collapse = "")
}

print(Filter(function(n) is_palindrome(n) && is_prime(n), 2:199))
# 2 3 5 7 11 101 131 151 181 191
