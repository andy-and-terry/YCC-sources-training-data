temps <- c(12, 18, 25, 31, 22, 35, 28)

print(which(temps > 25))
print(which.min(temps))
print(which.max(temps))
print(temps[which(temps > 25)])
print(any(temps > 34))
print(all(temps > 10))
print(sum(temps > 20))
print(mean(temps > 20))
print(range(temps))

m <- matrix(c(5, 8, 2, 9, 1, 7), nrow = 2)
print(which(m > 5))
print(which(m > 5, arr.ind = TRUE))

named <- c(a = 1, b = 5, c = 3)
print(which(named > 2))
print(names(which.max(named)))

print(match(c(31, 99), temps))
print(c(31, 99) %in% temps)
print(setdiff(1:5, c(2, 4)))

first_hot <- which(temps >= 30)[1]
print(first_hot)
print(rev(which(temps < 20))[1])
print(which(c(FALSE, NA, TRUE)))
print(Position(function(t) t > 30, temps))
print(Find(function(t) t > 30, temps))
