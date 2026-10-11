class Vehicle {
    let wheels: Int
    let name: String

    init(wheels: Int, name: String) {
        self.wheels = wheels
        self.name = name
    }

    convenience init(name: String) {
        self.init(wheels: 4, name: name)
    }

    convenience init() {
        self.init(name: "generic")
    }
}

class Bike: Vehicle {
    init() {
        super.init(wheels: 2, name: "bike")
    }
}

for v in [Vehicle(), Vehicle(name: "truck"), Bike()] {
    print("\(v.name) has \(v.wheels) wheels")
}
