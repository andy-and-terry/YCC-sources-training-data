extends Node

class BloomFilter:
	var bits: Array = []
	var size: int

	func _init(bit_size: int) -> void:
		size = bit_size
		bits.resize(size)
		bits.fill(false)

	func _hash1(s: String) -> int:
		return hash(s) % size

	func _hash2(s: String) -> int:
		return hash(s + "salt") % size

	func add(s: String) -> void:
		bits[_hash1(s)] = true
		bits[_hash2(s)] = true

	func might_contain(s: String) -> bool:
		return bits[_hash1(s)] and bits[_hash2(s)]

func _ready():
	var filter := BloomFilter.new(64)
	filter.add("apple")
	filter.add("banana")
	print("might contain apple: %s" % filter.might_contain("apple"))
	print("might contain cherry: %s" % filter.might_contain("cherry"))
