protocol Vehicle {
    func describe() -> String
}

struct Car: Vehicle {
    func describe() -> String { "Car" }
}

struct Truck: Vehicle {
    func describe() -> String { "Truck" }
}

enum VehicleType {
    case car, truck
}

enum VehicleFactory {
    static func make(_ type: VehicleType) -> Vehicle {
        switch type {
        case .car: return Car()
        case .truck: return Truck()
        }
    }
}

print(VehicleFactory.make(.car).describe())
print(VehicleFactory.make(.truck).describe())
