extends Node

func flood_fill(grid: Array, r: int, c: int, new_val: int) -> void:
	var old = grid[r][c]
	if old == new_val:
		return
	var stack = [Vector2i(r, c)]
	while stack.size() > 0:
		var p = stack.pop_back()
		if p.x < 0 or p.y < 0 or p.x >= grid.size() or p.y >= grid[0].size():
			continue
		if grid[p.x][p.y] != old:
			continue
		grid[p.x][p.y] = new_val
		for d in [Vector2i.UP, Vector2i.DOWN, Vector2i.LEFT, Vector2i.RIGHT]:
			stack.append(p + d)

func _ready():
	var g = [[1, 1, 0], [1, 0, 0], [1, 1, 1]]
	flood_fill(g, 0, 0, 7)
	print(g)
