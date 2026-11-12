extends Node
func _ready():
    var f := func(a, b): return a + b
    print(f.call(1, 2))
    var g := Callable(self, "hello").bind("bob")
    g.call()
func hello(n): print("hi ", n)
