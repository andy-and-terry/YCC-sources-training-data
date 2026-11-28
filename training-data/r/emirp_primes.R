is_prime <- function(n) n >= 2 && all(n %% seq_len(max(1, floor(sqrt(n))))[-1] != 0)
rev_num <- function(n) as.integer(paste(rev(strsplit(as.character(n), "")[[1]]), collapse = ""))

emirps <- Filter(function(p) is_prime(p) && rev_num(p) != p && is_prime(rev_num(p)), 2:99)
print(emirps)
