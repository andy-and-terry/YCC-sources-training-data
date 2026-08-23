extends Node

func word_frequency(text: String) -> Dictionary:
	var freq = {}
	for word in text.to_lower().split(" "):
		if freq.has(word):
			freq[word] += 1
		else:
			freq[word] = 1
	return freq

func _ready():
	print(word_frequency("the quick brown fox the lazy fox"))
