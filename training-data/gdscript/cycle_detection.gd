extends Node

func has_cycle(graph: Dictionary) -> bool:
	var visited = {}
	var in_stack = {}

	var visit = func(node, visit_ref):
		visited[node] = true
		in_stack[node] = true
		for neighbor in graph.get(node, []):
			if not visited.has(neighbor):
				if visit_ref.call(neighbor, visit_ref):
					return true
			elif in_stack.get(neighbor, false):
				return true
		in_stack[node] = false
		return false

	for node in graph.keys():
		if not visited.has(node):
			if visit.call(node, visit):
				return true
	return false

func _ready():
	var acyclic = {"a": ["b"], "b": ["c"], "c": []}
	var cyclic = {"a": ["b"], "b": ["c"], "c": ["a"]}
	print(has_cycle(acyclic))
	print(has_cycle(cyclic))
