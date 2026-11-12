trait Walks { String move() { "${name} walks" } }
class Dog implements Walks { String name = 'rex' }
println new Dog().move()
