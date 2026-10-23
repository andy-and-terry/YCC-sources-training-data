scores <- c(82, 91, 77, 68, 95, 88, 73)
team <- c("a", "b", "a", "c", "b", "c", "a")

print(tapply(scores, team, mean))
print(tapply(scores, team, max))
print(tapply(scores, team, length))

by_team <- split(scores, team)
print(sapply(by_team, range))
print(sapply(by_team, function(x) round(sd(x), 2)))

sex <- c("m", "f", "m", "f", "f", "m", "m")
print(tapply(scores, list(team, sex), sum))
