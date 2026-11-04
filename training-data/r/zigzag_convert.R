zigzag <- function(s, rows) {
  chars <- strsplit(s, "")[[1]]
  if (rows == 1 || rows >= length(chars)) return(s)
  cycle <- c(seq_len(rows), rev(seq_len(rows))[-c(1, rows)])
  row_of <- rep_len(cycle, length(chars))
  paste(chars[order(row_of)], collapse = "")  # order() is stable, so reading order is kept
}

cat(zigzag("PAYPALISHIRING", 3), "\n")
