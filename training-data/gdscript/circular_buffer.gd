extends Node

class CircularBuffer:
	var data = []
	var capacity: int
	var size = 0
	var start = 0

	func _init(cap: int):
		capacity = cap
		data.resize(cap)

	func push(value):
		var index = (start + size) % capacity
		data[index] = value
		if size < capacity:
			size += 1
		else:
			start = (start + 1) % capacity

	func to_array() -> Array:
		var result = []
		for i in range(size):
			result.append(data[(start + i) % capacity])
		return result

func _ready():
	var buf = CircularBuffer.new(3)
	for v in [1, 2, 3, 4, 5]:
		buf.push(v)
	print(buf.to_array())
