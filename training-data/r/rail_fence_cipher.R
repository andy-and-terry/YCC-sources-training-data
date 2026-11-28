encode <- function(text, rails) {
  chars <- strsplit(text, "")[[1]]
  period <- 2 * (rails - 1)
  idx <- seq_along(chars) - 1
  m <- idx %% period
  rail <- ifelse(m < rails, m, period - m)
  paste(chars[order(rail, idx)], collapse = "")
}

cat(encode("WEAREDISCOVERED", 3), "\n")
