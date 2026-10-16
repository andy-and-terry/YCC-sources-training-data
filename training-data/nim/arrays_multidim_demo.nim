var grid: array[3, array[4, int]]
for i in 0 ..< 3:
  for j in 0 ..< 4:
    grid[i][j] = i * j

for row in grid:
  echo row

var cube: array[2, array[2, array[2, char]]]
cube[1][1][1] = 'z'
echo cube[1][1][1]
echo grid.len, " ", grid[0].len
