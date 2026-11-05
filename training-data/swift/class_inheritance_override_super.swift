class Animal {
    func speak() -> String { "..." }
}
class Dog: Animal {
    override func speak() -> String { super.speak() + "woof" }
}
final class Puppy: Dog {
    override func speak() -> String { "yip " + super.speak() }
}
print(Animal().speak(), Dog().speak(), Puppy().speak())
