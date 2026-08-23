extends Node

func is_valid(s: String) -> bool:
	var stack = []
	var pairs = {")": "(", "]": "[", "}": "{"}
	for c in s:
		if c in ["(", "[", "{"]:
			stack.append(c)
		elif c in [")", "]", "}"]:
			if stack.is_empty() or stack[-1] != pairs[c]:
				return false
			stack.pop_back()
	return stack.is_empty()

func _ready():
	print(is_valid("{[()]}"))
	print(is_valid("{[(])}"))
