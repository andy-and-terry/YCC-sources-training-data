extends Node

var cells := {}

func set_cell(r: int, c: int, v: float) -> void:
	if v == 0.0:
		cells.erase(Vector2i(r, c))
	else:
		cells[Vector2i(r, c)] = v

func get_cell(r: int, c: int) -> float:
	return cells.get(Vector2i(r, c), 0.0)

func row_sum(r: int) -> float:
	var s := 0.0
	for k in cells:
		if k.x == r:
			s += cells[k]
	return s

func _ready():
	set_cell(0, 5, 2.5)
	set_cell(0, 9, 1.5)
	set_cell(3, 3, 7.0)
	print(get_cell(0, 5), " ", get_cell(1, 1))
	print(row_sum(0), " stored=", cells.size())
	set_cell(3, 3, 0.0)
	print(cells.size())
