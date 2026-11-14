extends Node

func _ready():
    var scores: Array[int] = [3, 9, 4]
    scores.sort()
    var d := {"a": 1, "b": 2}
    for k in d:
        print(k, "=", d[k])
    print(scores.max(), scores.map(func(x): return x * 2))
