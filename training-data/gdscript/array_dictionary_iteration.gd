extends Node
func _ready():
    var d = {"a": 1, "b": 2}
    for k in d:
        print(k, "=", d[k])
    var a = [3, 1, 2]
    a.sort()
    print(a, a.map(func(x): return x * 2))
