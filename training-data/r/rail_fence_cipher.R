rail_order <- function(n, k) {
  cycle <- 2 * (k - 1)
  r <- (0:(n - 1)) %% cycle
  rail <- ifelse(r < k, r, cycle - r)
  order(rail)  # order() is stable for ties
}

encrypt <- function(text, k) {
  chars <- strsplit(text, "")[[1]]
  paste(chars[rail_order(length(chars), k)], collapse = "")
}

decrypt <- function(cipher, k) {
  chars <- strsplit(cipher, "")[[1]]
  out <- character(length(chars))
  out[rail_order(length(chars), k)] <- chars
  paste(out, collapse = "")
}

c <- encrypt("WEAREDISCOVERED", 3)
cat(c, decrypt(c, 3), "\n")
