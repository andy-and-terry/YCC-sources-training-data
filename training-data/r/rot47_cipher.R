rot47 <- function(s) {
  codes <- utf8ToInt(s)
  inr <- codes >= 33 & codes <= 126
  codes[inr] <- 33 + (codes[inr] - 33 + 47) %% 94
  intToUtf8(codes)
}
e <- rot47("Hello, World!")
print(e)
print(rot47(e))
