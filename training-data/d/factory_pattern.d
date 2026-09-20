import std.stdio;

interface Vehicle {
    string drive();
}

class Car : Vehicle {
    string drive() {
        return "driving a car";
    }
}

class Truck : Vehicle {
    string drive() {
        return "hauling with a truck";
    }
}

Vehicle createVehicle(string kind) {
    switch (kind) {
        case "car":
            return new Car();
        case "truck":
            return new Truck();
        default:
            throw new Exception("unknown vehicle kind: " ~ kind);
    }
}

void main() {
    foreach (kind; ["car", "truck"]) {
        auto vehicle = createVehicle(kind);
        writeln(vehicle.drive());
    }
}
