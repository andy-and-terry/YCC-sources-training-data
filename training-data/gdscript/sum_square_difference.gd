# Square of the sum minus sum of squares for 1..10 (expect 2640)
extends Node

func _ready() -> void:
	var total := 0
	var squares := 0
	for i in range(1, 11):
		total += i
		squares += i * i
	print(total * total - squares)
