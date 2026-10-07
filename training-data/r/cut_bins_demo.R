# Turning numeric values into categories with cut() and findInterval().
ages <- c(3, 17, 25, 42, 67, 80)

groups <- cut(ages,
              breaks = c(0, 12, 19, 64, Inf),
              labels = c("child", "teen", "adult", "senior"),
              right = TRUE)
print(groups)
print(table(groups))

print(cut(c(1, 5, 10), breaks = 3))

breaks <- c(0, 10, 20, 30)
print(findInterval(c(5, 10, 25, 31), breaks))
