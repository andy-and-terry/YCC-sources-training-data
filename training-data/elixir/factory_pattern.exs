defmodule Car do
  defstruct []
  def drive(%Car{}), do: "driving a car"
end

defmodule Truck do
  defstruct []
  def drive(%Truck{}), do: "hauling with a truck"
end

defmodule VehicleFactory do
  def create("car"), do: %Car{}
  def create("truck"), do: %Truck{}
  def create(kind), do: raise(ArgumentError, "unknown vehicle kind: #{kind}")
end

defmodule Vehicle do
  def drive(%Car{} = car), do: Car.drive(car)
  def drive(%Truck{} = truck), do: Truck.drive(truck)
end

for kind <- ["car", "truck"] do
  vehicle = VehicleFactory.create(kind)
  IO.puts(Vehicle.drive(vehicle))
end
