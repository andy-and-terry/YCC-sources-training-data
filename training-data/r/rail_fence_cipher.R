rail_fence <- function(s, rails) {
  chars <- strsplit(s, "")[[1]]
  pattern <- c(seq_len(rails), rev(seq_len(rails))[-c(1, rails)])
  idx <- rep_len(pattern, length(chars))
  paste(chars[order(idx, seq_along(chars))], collapse = "")
}
print(rail_fence("WEAREDISCOVERED", 3))
