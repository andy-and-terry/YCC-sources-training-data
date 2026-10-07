class Owner {
    let name: String
    var pet: Pet?
    init(name: String) { self.name = name }
    deinit { print("Owner \(name) freed") }
}

class Pet {
    let name: String
    weak var owner: Owner?
    init(name: String) { self.name = name }
    deinit { print("Pet \(name) freed") }
}

var owner: Owner? = Owner(name: "Alice")
let pet = Pet(name: "Rex")
owner?.pet = pet
pet.owner = owner

print(pet.owner?.name ?? "none")
owner = nil
print(pet.owner?.name ?? "none")
