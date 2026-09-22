extends Node

func flood_fill(grid: Array, row: int, col: int):
	if row < 0 or row >= grid.size() or col < 0 or col >= grid[0].size():
		return
	if grid[row][col] != 1:
		return
	grid[row][col] = 0
	flood_fill(grid, row + 1, col)
	flood_fill(grid, row - 1, col)
	flood_fill(grid, row, col + 1)
	flood_fill(grid, row, col - 1)

func count_islands(grid: Array) -> int:
	var count = 0
	for row in range(grid.size()):
		for col in range(grid[0].size()):
			if grid[row][col] == 1:
				count += 1
				flood_fill(grid, row, col)
	return count

func _ready():
	var grid = [
		[1, 1, 0, 0, 0],
		[1, 1, 0, 0, 0],
		[0, 0, 1, 0, 0],
		[0, 0, 0, 1, 1],
	]
	print(count_islands(grid))
