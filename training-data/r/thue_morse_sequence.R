# Thue-Morse: t(n) is the parity of the number of 1 bits in n
parity <- function(n) sum(as.integer(intToBits(n))) %% 2
cat(sapply(0:31, parity), sep = "")
cat("\n")
