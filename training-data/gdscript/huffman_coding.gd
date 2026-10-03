extends Node

class HuffmanNode:
	var char: String
	var freq: int
	var left: HuffmanNode = null
	var right: HuffmanNode = null

	func _init(c: String, f: int) -> void:
		char = c
		freq = f

func build_tree(freqs: Dictionary) -> HuffmanNode:
	var nodes: Array = []
	for c in freqs:
		nodes.append(HuffmanNode.new(c, freqs[c]))

	while nodes.size() > 1:
		nodes.sort_custom(func(a, b): return a.freq < b.freq)
		var left = nodes.pop_front()
		var right = nodes.pop_front()
		var parent := HuffmanNode.new("", left.freq + right.freq)
		parent.left = left
		parent.right = right
		nodes.append(parent)
	return nodes[0]

func build_codes(node: HuffmanNode, prefix: String, codes: Dictionary) -> void:
	if node.left == null and node.right == null:
		codes[node.char] = prefix
		return
	build_codes(node.left, prefix + "0", codes)
	build_codes(node.right, prefix + "1", codes)

func _ready():
	var freqs := {"a": 5, "b": 9, "c": 12, "d": 13, "e": 16, "f": 45}
	var root := build_tree(freqs)
	var codes := {}
	build_codes(root, "", codes)
	for c in codes:
		print("%s: %s" % [c, codes[c]])
