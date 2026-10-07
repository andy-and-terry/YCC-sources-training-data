names_vec <- c("Ada", "Bob", "Cleopatra")

print(formatC(names_vec, width = 10))
print(formatC(names_vec, width = -10))
print(sprintf("%-10s | %5.2f", names_vec, c(1, 22.5, 333.125)))
print(strrep("-", 20))
print(formatC(42, width = 6, flag = "0"))
