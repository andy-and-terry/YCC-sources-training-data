extends Node
func add(a: int, b: int) -> int:
    return a + b
func _ready() -> void:
    var x: float = 2.5
    print(add(1, 2), x * 2)
