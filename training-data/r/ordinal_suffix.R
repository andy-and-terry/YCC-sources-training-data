ordinal <- function(n) {
  suffix <- ifelse(n %% 100 %in% 11:13, "th",
            ifelse(n %% 10 == 1, "st",
            ifelse(n %% 10 == 2, "nd",
            ifelse(n %% 10 == 3, "rd", "th"))))
  paste0(n, suffix)
}

cat(ordinal(c(1, 2, 3, 4, 11, 12, 13, 21, 101, 111)), "\n")
