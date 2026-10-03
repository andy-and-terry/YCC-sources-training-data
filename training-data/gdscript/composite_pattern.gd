extends Node

class FileNode:
	var name: String
	var size: int

	func _init(n: String, s: int) -> void:
		name = n
		size = s

	func total_size() -> int:
		return size

class FolderNode:
	var name: String
	var children: Array = []

	func _init(n: String) -> void:
		name = n

	func add(child) -> void:
		children.append(child)

	func total_size() -> int:
		var sum := 0
		for child in children:
			sum += child.total_size()
		return sum

func _ready():
	var root := FolderNode.new("root")
	var docs := FolderNode.new("docs")
	docs.add(FileNode.new("readme.txt", 10))
	docs.add(FileNode.new("notes.txt", 5))
	root.add(docs)
	root.add(FileNode.new("main.gd", 20))
	print("total size: %d" % root.total_size())
