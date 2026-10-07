class Engine {
    int horsepower = 300

    String start() {
        return "engine roaring at ${horsepower}hp"
    }
}

class Car {
    @Delegate
    Engine engine = new Engine()

    String drive() {
        return "driving: ${start()}"
    }
}

def car = new Car()
println car.start()
println car.drive()
println car.horsepower
