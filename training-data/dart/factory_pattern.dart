abstract class Vehicle {
  String drive();
}

class Car implements Vehicle {
  @override
  String drive() => 'driving a car';
}

class Truck implements Vehicle {
  @override
  String drive() => 'hauling with a truck';
}

class VehicleFactory {
  static Vehicle create(String kind) {
    switch (kind) {
      case 'car':
        return Car();
      case 'truck':
        return Truck();
      default:
        throw ArgumentError('unknown vehicle kind: $kind');
    }
  }
}

void main() {
  for (final kind in ['car', 'truck']) {
    final vehicle = VehicleFactory.create(kind);
    print(vehicle.drive());
  }
}
