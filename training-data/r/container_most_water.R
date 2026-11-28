max_area <- function(h) {
  lo <- 1
  hi <- length(h)
  best <- 0
  while (lo < hi) {
    best <- max(best, min(h[lo], h[hi]) * (hi - lo))
    if (h[lo] < h[hi]) lo <- lo + 1 else hi <- hi - 1
  }
  best
}

print(max_area(c(1, 8, 6, 2, 5, 4, 8, 3, 7))) # 49
