extends Node

func _ready():
    var scores: Array[int] = [3, 1, 2]
    scores.sort()
    var d := {"a": 1, "b": 2}
    for k in d:
        print(k, d[k])
    print(scores)
