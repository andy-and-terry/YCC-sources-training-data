affine <- function(text, a, b) {
  x <- utf8ToInt(text) - 65
  intToUtf8((a * x + b) %% 26 + 65)
}

print(affine("AFFINE", 5, 8))
