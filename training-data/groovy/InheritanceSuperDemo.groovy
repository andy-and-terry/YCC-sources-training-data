abstract class Shape {
    String name
    abstract double area()
    String toString() { "$name area=${String.format('%.2f', area())}" }
}

class Circle extends Shape {
    double r
    Circle(double r) { this.name = 'circle'; this.r = r }
    double area() { Math.PI * r * r }
}

class Square extends Shape {
    double s
    Square(double s) { this.name = 'square'; this.s = s }
    double area() { s * s }
    String toString() { super.toString() + ' (square)' }
}

def shapes = [new Circle(1), new Square(2)]
shapes.each { println it }
println shapes*.area().sum()
println shapes.every { it instanceof Shape }
