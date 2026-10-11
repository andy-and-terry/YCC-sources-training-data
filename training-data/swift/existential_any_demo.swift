protocol Animal {
    var name: String { get }
    func sound() -> String
}

struct Dog: Animal {
    let name = "Dog"
    func sound() -> String { "woof" }
}

struct Cat: Animal {
    let name = "Cat"
    func sound() -> String { "meow" }
}

let zoo: [any Animal] = [Dog(), Cat(), Dog()]

for animal in zoo {
    print("\(animal.name) says \(animal.sound())")
}
