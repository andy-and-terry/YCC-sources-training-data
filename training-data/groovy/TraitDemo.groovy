trait Flyable {
    String fly() { return "I can fly" }
}

trait Swimmable {
    String swim() { return "I can swim" }
}

class Duck implements Flyable, Swimmable {
}

def duck = new Duck()
println duck.fly()
println duck.swim()
