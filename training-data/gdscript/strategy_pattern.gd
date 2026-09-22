extends Node

class SortStrategy:
	func sort(data: Array) -> Array:
		return data

class AscendingStrategy extends SortStrategy:
	func sort(data: Array) -> Array:
		var result = data.duplicate()
		result.sort()
		return result

class DescendingStrategy extends SortStrategy:
	func sort(data: Array) -> Array:
		var result = data.duplicate()
		result.sort()
		result.reverse()
		return result

class Sorter:
	var strategy: SortStrategy

	func _init(s: SortStrategy):
		strategy = s

	func set_strategy(s: SortStrategy) -> void:
		strategy = s

	func execute(data: Array) -> Array:
		return strategy.sort(data)

func _ready():
	var sorter = Sorter.new(AscendingStrategy.new())
	print(sorter.execute([5, 2, 8, 1, 9]))
	sorter.set_strategy(DescendingStrategy.new())
	print(sorter.execute([5, 2, 8, 1, 9]))
