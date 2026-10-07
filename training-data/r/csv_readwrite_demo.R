df <- data.frame(
  name = c("Alice", "Bob", "Carol"),
  score = c(91, 78, 85),
  stringsAsFactors = FALSE
)

tmp_path <- tempfile(fileext = ".csv")
write.csv(df, tmp_path, row.names = FALSE)

loaded <- read.csv(tmp_path, stringsAsFactors = FALSE)
print(loaded)
cat("mean score:", mean(loaded$score), "\n")

unlink(tmp_path)
