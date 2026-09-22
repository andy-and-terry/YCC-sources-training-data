make_bloom_filter <- function(size, num_hashes) {
  list(bits = logical(size), size = size, num_hashes = num_hashes)
}

bloom_hash <- function(value, seed, size) {
  s <- paste0(seed, ":", value)
  codes <- utf8ToInt(s)
  h <- sum(codes * seq_along(codes))
  (h %% size) + 1
}

bloom_add <- function(bf, value) {
  for (seed in seq_len(bf$num_hashes)) {
    idx <- bloom_hash(value, seed, bf$size)
    bf$bits[idx] <- TRUE
  }
  bf
}

bloom_might_contain <- function(bf, value) {
  for (seed in seq_len(bf$num_hashes)) {
    idx <- bloom_hash(value, seed, bf$size)
    if (!bf$bits[idx]) return(FALSE)
  }
  TRUE
}

bf <- make_bloom_filter(64, 3)
bf <- bloom_add(bf, "apple")
bf <- bloom_add(bf, "banana")

print(bloom_might_contain(bf, "apple"))
print(bloom_might_contain(bf, "banana"))
print(bloom_might_contain(bf, "cherry"))
