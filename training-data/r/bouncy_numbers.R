# Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
is_bouncy <- function(n) {
  d <- as.integer(strsplit(as.character(n), "")[[1]])
  is.unsorted(d) && is.unsorted(rev(d))
}

cat(sum(vapply(1:999, is_bouncy, logical(1))), "\n")
