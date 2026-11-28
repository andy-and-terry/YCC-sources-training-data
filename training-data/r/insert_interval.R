insert_interval <- function(iv, new) {
  before <- iv[iv[, 2] < new[1], , drop = FALSE]
  after <- iv[iv[, 1] > new[2], , drop = FALSE]
  overlap <- iv[iv[, 2] >= new[1] & iv[, 1] <= new[2], , drop = FALSE]
  merged <- c(min(new[1], overlap[, 1]), max(new[2], overlap[, 2]))
  rbind(before, merged, after)
}

iv <- matrix(c(1, 3, 6, 9), ncol = 2, byrow = TRUE)
print(unname(insert_interval(iv, c(2, 5)))) # rows: (1,5) (6,9)
