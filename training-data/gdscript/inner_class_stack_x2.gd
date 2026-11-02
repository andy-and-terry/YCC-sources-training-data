extends Node

class Stack:
    var _items := []
    func push(x): _items.append(x)
    func pop(): return _items.pop_back()

func _ready():
    var s := Stack.new()
    s.push(1)
    s.push(2)
    print(s.pop())
