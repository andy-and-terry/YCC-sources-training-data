extends Node
class Animal:
    func speak() -> String: return "..."
class Dog extends Animal:
    func speak() -> String: return "woof " + super.speak()
func _ready():
    print(Dog.new().speak())
