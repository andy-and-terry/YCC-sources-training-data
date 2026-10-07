abstract type FlightTrait end
struct CanFly <: FlightTrait end
struct CannotFly <: FlightTrait end

flight_trait(::Any) = CannotFly()

struct Sparrow end
struct Penguin end
struct Airplane end

flight_trait(::Sparrow) = CanFly()
flight_trait(::Airplane) = CanFly()
flight_trait(::Penguin) = CannotFly()

move(x) = move(flight_trait(x), x)
move(::CanFly, x) = "$(typeof(x)) flies through the air"
move(::CannotFly, x) = "$(typeof(x)) stays on the ground"

for thing in (Sparrow(), Penguin(), Airplane())
    println(move(thing))
end
