trait Flyer {
    String fly() { "${name} flies" }
}
class Bird implements Flyer {
    String name
}
println new Bird(name: 'Tweety').fly()
