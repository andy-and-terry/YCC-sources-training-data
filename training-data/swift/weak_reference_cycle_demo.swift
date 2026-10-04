class Owner {
    let name: String
    var pets: [Pet] = []

    init(name: String) {
        self.name = name
        print("Owner \(name) created")
    }

    deinit {
        print("Owner \(name) deinitialized")
    }
}

class Pet {
    let name: String
    weak var owner: Owner?

    init(name: String, owner: Owner) {
        self.name = name
        self.owner = owner
        print("Pet \(name) created")
    }

    deinit {
        print("Pet \(name) deinitialized")
    }
}

func scope() {
    let owner = Owner(name: "Ann")
    let pet = Pet(name: "Rex", owner: owner)
    owner.pets.append(pet)
    print(pet.owner?.name ?? "no owner")
}
scope()

var temp: Owner? = Owner(name: "Bob")
let pet = Pet(name: "Tom", owner: temp!)
temp = nil
print(pet.owner == nil)

class Task {
    var onDone: (() -> Void)?
    let id: Int
    init(id: Int) { self.id = id }
    func start() {
        onDone = { [weak self] in
            guard let self else { return }
            print("task \(self.id) finished")
        }
    }
    deinit { print("Task \(id) deinitialized") }
}

var task: Task? = Task(id: 1)
task?.start()
task?.onDone?()
task = nil
