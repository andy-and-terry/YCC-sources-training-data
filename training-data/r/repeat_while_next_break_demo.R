i <- 0
while (TRUE) {
  i <- i + 1
  if (i %% 2 == 0) next
  if (i > 9) break
  cat("odd:", i, "\n")
}

n <- 27
steps <- 0
while (n != 1) {
  n <- if (n %% 2 == 0) n / 2 else 3 * n + 1
  steps <- steps + 1
}
cat("collatz steps:", steps, "\n")

for (row in 1:3) {
  for (col in 1:3) {
    if (col > row) break
    cat(row * col, "")
  }
  cat("\n")
}

total <- 0
for (x in c(4, NA, 6)) {
  if (is.na(x)) next
  total <- total + x
}
print(total)
