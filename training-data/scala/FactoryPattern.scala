trait Vehicle {
  def describe(): String
}

class Car extends Vehicle {
  def describe(): String = "Car"
}

class Truck extends Vehicle {
  def describe(): String = "Truck"
}

class Motorcycle extends Vehicle {
  def describe(): String = "Motorcycle"
}

object VehicleFactory {
  def create(kind: String): Vehicle = kind match {
    case "car"        => new Car
    case "truck"       => new Truck
    case "motorcycle" => new Motorcycle
    case other        => throw new IllegalArgumentException(s"Unknown vehicle kind: $other")
  }
}

object FactoryPatternDemo {
  def main(args: Array[String]): Unit = {
    List("car", "truck", "motorcycle").foreach { kind =>
      println(VehicleFactory.create(kind).describe())
    }
  }
}
