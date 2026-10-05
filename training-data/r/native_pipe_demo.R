square <- function(x) x^2

result <- c(1, 2, 3, 4, 5) |>
  square() |>
  sum() |>
  sqrt()
print(result)

mtcars |>
  subset(cyl == 4, select = c(mpg, hp)) |>
  head(3) |>
  print()

words <- c("pipe", "operator", "in", "base", "R")
words |>
  nchar() |>
  setNames(words) |>
  sort(decreasing = TRUE) |>
  print()

sq <- \(x) x * x
print(1:4 |> sapply(sq))
print(c(4, 9) |> (\(v) sqrt(v) + 1)())
