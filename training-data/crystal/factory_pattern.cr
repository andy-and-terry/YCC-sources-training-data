abstract class Vehicle
  abstract def drive : String
end

class Car < Vehicle
  def drive : String
    "driving a car"
  end
end

class Truck < Vehicle
  def drive : String
    "hauling with a truck"
  end
end

class VehicleFactory
  def self.create(kind : String) : Vehicle
    case kind
    when "car"
      Car.new
    when "truck"
      Truck.new
    else
      raise ArgumentError.new("unknown vehicle kind: #{kind}")
    end
  end
end

["car", "truck"].each do |kind|
  vehicle = VehicleFactory.create(kind)
  puts vehicle.drive
end
