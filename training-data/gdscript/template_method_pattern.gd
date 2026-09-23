extends Node

class DataProcessor:
	func process(data: Array) -> Array:
		var loaded = load_data(data)
		var transformed = transform(loaded)
		output(transformed)
		return transformed

	func load_data(data: Array) -> Array:
		return data

	func transform(data: Array) -> Array:
		return data

	func output(data: Array):
		print(data)

class DoublingProcessor extends DataProcessor:
	func transform(data: Array) -> Array:
		var result = []
		for x in data:
			result.append(x * 2)
		return result

	func output(data: Array):
		print("doubled: ", data)

class SumProcessor extends DataProcessor:
	func transform(data: Array) -> Array:
		var total = 0
		for x in data:
			total += x
		return [total]

	func output(data: Array):
		print("sum: ", data[0])

func _ready():
	var data = [1, 2, 3, 4, 5]
	DoublingProcessor.new().process(data)
	SumProcessor.new().process(data)
