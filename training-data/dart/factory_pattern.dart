abstract class Vehicle {
  String describe();

  factory Vehicle(String kind) {
    switch (kind) {
      case 'car':
        return Car();
      case 'motorcycle':
        return Motorcycle();
      case 'truck':
        return Truck();
      default:
        throw ArgumentError('unknown vehicle kind: $kind');
    }
  }
}

class Car implements Vehicle {
  @override
  String describe() => 'a car with 4 wheels';
}

class Motorcycle implements Vehicle {
  @override
  String describe() => 'a motorcycle with 2 wheels';
}

class Truck implements Vehicle {
  @override
  String describe() => 'a truck with 6 wheels';
}

void main() {
  for (final kind in ['car', 'motorcycle', 'truck']) {
    final vehicle = Vehicle(kind);
    print(vehicle.describe());
  }
}
