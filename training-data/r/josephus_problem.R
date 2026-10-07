josephus <- function(n, k) {
  people <- 1:n
  index <- 1

  while (length(people) > 1) {
    index <- ((index + k - 2) %% length(people)) + 1
    people <- people[-index]
    if (index > length(people)) index <- 1
  }
  people[1]
}

print(josephus(7, 3))
print(josephus(1, 5))
print(josephus(10, 2))
