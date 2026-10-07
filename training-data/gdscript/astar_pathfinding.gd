extends Node

func heuristic(a: Vector2i, b: Vector2i) -> int:
	return abs(a.x - b.x) + abs(a.y - b.y)

func neighbors(pos: Vector2i, grid: Array) -> Array:
	var result = []
	var dirs = [Vector2i(1, 0), Vector2i(-1, 0), Vector2i(0, 1), Vector2i(0, -1)]
	for d in dirs:
		var n = pos + d
		if n.y >= 0 and n.y < grid.size() and n.x >= 0 and n.x < grid[0].size():
			if grid[n.y][n.x] == 0:
				result.append(n)
	return result

func find_path(grid: Array, start: Vector2i, goal: Vector2i) -> Array:
	var open_set = [start]
	var came_from = {}
	var g_score = {start: 0}
	var f_score = {start: heuristic(start, goal)}

	while not open_set.is_empty():
		var current = open_set[0]
		for node in open_set:
			if f_score.get(node, INF) < f_score.get(current, INF):
				current = node

		if current == goal:
			var path = [current]
			while came_from.has(current):
				current = came_from[current]
				path.push_front(current)
			return path

		open_set.erase(current)
		for neighbor in neighbors(current, grid):
			var tentative = g_score[current] + 1
			if tentative < g_score.get(neighbor, INF):
				came_from[neighbor] = current
				g_score[neighbor] = tentative
				f_score[neighbor] = tentative + heuristic(neighbor, goal)
				if not open_set.has(neighbor):
					open_set.append(neighbor)
	return []

func _ready():
	var grid = [
		[0, 0, 0, 0],
		[0, 1, 1, 0],
		[0, 0, 0, 0],
		[1, 1, 0, 0],
	]
	var path = find_path(grid, Vector2i(0, 0), Vector2i(3, 3))
	for step in path:
		print(step)
