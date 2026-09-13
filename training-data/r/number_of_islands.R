count_islands <- function(grid) {
  rows <- nrow(grid)
  cols <- ncol(grid)
  visited <- matrix(FALSE, rows, cols)

  flood_fill <- function(r, c) {
    if (r < 1 || r > rows || c < 1 || c > cols) return(invisible())
    if (visited[r, c] || grid[r, c] == 0) return(invisible())
    visited[r, c] <<- TRUE
    flood_fill(r + 1, c)
    flood_fill(r - 1, c)
    flood_fill(r, c + 1)
    flood_fill(r, c - 1)
  }

  count <- 0
  for (r in 1:rows) {
    for (c in 1:cols) {
      if (grid[r, c] == 1 && !visited[r, c]) {
        count <- count + 1
        flood_fill(r, c)
      }
    }
  }
  count
}

grid <- matrix(c(
  1, 1, 0, 0,
  1, 1, 0, 0,
  0, 0, 1, 0,
  0, 0, 0, 1
), nrow = 4, byrow = TRUE)

print(count_islands(grid))
