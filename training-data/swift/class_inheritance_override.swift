class Animal {
    func speak() -> String { "..." }
}
class Cat: Animal {
    override func speak() -> String { "meow" }
}
let animals: [Animal] = [Animal(), Cat()]
animals.forEach { print($0.speak()) }
