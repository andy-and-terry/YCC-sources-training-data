extends Node
func _ready():
    var a := Vector2(0, 0)
    var b := Vector2(3, 4)
    print(a.distance_to(b), (b - a).normalized(), b.dot(Vector2.RIGHT))
