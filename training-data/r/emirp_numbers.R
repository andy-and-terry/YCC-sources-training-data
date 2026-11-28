is_prime <- function(n) n >= 2 && all(n %% seq_len(max(1, floor(sqrt(n))))[-1] != 0)

rev_num <- function(n) as.integer(paste(rev(strsplit(as.character(n), "")[[1]]), collapse = ""))

emirps <- Filter(function(p) rev_num(p) != p && is_prime(p) && is_prime(rev_num(p)), 2:199)
print(emirps) # 13 17 31 37 71 73 79 97 107 113 149 157 167 179 199
