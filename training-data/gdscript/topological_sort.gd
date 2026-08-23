extends Node

func visit(node, graph: Dictionary, visited: Dictionary, order: Array):
	if visited.has(node):
		return
	visited[node] = true
	for dep in graph.get(node, []):
		visit(dep, graph, visited, order)
	order.append(node)

func topo_sort(graph: Dictionary) -> Array:
	var visited = {}
	var order = []
	for node in graph.keys():
		visit(node, graph, visited, order)
	return order

func _ready():
	var graph = {"a": ["b", "c"], "b": ["d"], "c": ["d"], "d": []}
	print(topo_sort(graph))
