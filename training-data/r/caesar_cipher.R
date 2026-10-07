caesar <- function(text, shift) {
  shift_chars <- function(chars, base) {
    (chars - base + shift) %% 26 + base
  }
  codes <- utf8ToInt(text)
  upper <- codes >= 65 & codes <= 90
  lower <- codes >= 97 & codes <= 122
  codes[upper] <- shift_chars(codes[upper], 65)
  codes[lower] <- shift_chars(codes[lower], 97)
  intToUtf8(codes)
}

encrypted <- caesar("Hello, World!", 3)
print(encrypted)
print(caesar(encrypted, -3))
print(chartr("abc", "xyz", "aabbcc"))
