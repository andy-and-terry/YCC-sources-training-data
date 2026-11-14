extends Node

class Item:
    var name: String
    var qty: int
    func _init(n: String, q: int):
        name = n
        qty = q

func _ready():
    var inv = [Item.new("potion", 3), Item.new("sword", 1)]
    for it in inv:
        print(it.name, " x", it.qty)
