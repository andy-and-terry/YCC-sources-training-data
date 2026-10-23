trait Flyer {
    String fly() { "${name} flies" }
}

trait Swimmer {
    String swim() { "${name} swims" }
}

class Duck implements Flyer, Swimmer {
    String name = 'Duck'
}

def d = new Duck()
println d.fly()
println d.swim()
println d instanceof Flyer
