import std.stdio;

interface Vehicle {
    string describe();
}

class Car : Vehicle {
    string describe() { return "a car with 4 wheels"; }
}

class Motorcycle : Vehicle {
    string describe() { return "a motorcycle with 2 wheels"; }
}

class Truck : Vehicle {
    string describe() { return "a truck with 6 wheels"; }
}

class VehicleFactory {
    static Vehicle create(string kind) {
        switch (kind) {
            case "car": return new Car();
            case "motorcycle": return new Motorcycle();
            case "truck": return new Truck();
            default: throw new Exception("unknown vehicle kind: " ~ kind);
        }
    }
}

void main() {
    foreach (kind; ["car", "motorcycle", "truck"]) {
        auto vehicle = VehicleFactory.create(kind);
        writeln(vehicle.describe());
    }
}
