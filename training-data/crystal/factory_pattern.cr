abstract class Vehicle
  abstract def describe : String
end

class Car < Vehicle
  def describe : String
    "a car with 4 wheels"
  end
end

class Motorcycle < Vehicle
  def describe : String
    "a motorcycle with 2 wheels"
  end
end

class Truck < Vehicle
  def describe : String
    "a truck with 6 wheels"
  end
end

class VehicleFactory
  def self.create(kind : String) : Vehicle
    case kind
    when "car"
      Car.new
    when "motorcycle"
      Motorcycle.new
    when "truck"
      Truck.new
    else
      raise ArgumentError.new("unknown vehicle kind: #{kind}")
    end
  end
end

["car", "motorcycle", "truck"].each do |kind|
  vehicle = VehicleFactory.create(kind)
  puts vehicle.describe
end
