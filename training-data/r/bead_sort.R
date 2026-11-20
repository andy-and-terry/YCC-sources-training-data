# Bead (gravity) sort.
bead_sort <- function(nums) {
  cols <- sapply(seq_len(max(nums)), function(i) sum(nums >= i))
  rev(sapply(seq_along(nums), function(r) sum(cols >= r)))
}
print(bead_sort(c(5, 3, 1, 4, 2)))
