extends Node

class TrieNode:
	var children = {}
	var is_end = false

func insert(root: TrieNode, word: String):
	var node = root
	for c in word:
		if not node.children.has(c):
			node.children[c] = TrieNode.new()
		node = node.children[c]
	node.is_end = true

func contains(root: TrieNode, word: String) -> bool:
	var node = root
	for c in word:
		if not node.children.has(c):
			return false
		node = node.children[c]
	return node.is_end

func _ready():
	var trie = TrieNode.new()
	insert(trie, "cat")
	insert(trie, "car")
	print(contains(trie, "cat"))
	print(contains(trie, "ca"))
