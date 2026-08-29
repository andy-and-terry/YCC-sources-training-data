interface Shape : Object {
    public abstract double area();
}

class Rectangle : Object, Shape {
    public double width;
    public double height;

    public Rectangle(double w, double h) {
        width = w;
        height = h;
    }

    public double area() {
        return width * height;
    }
}

void main() {
    var r = new Rectangle(4.0, 5.0);
    stdout.printf("%f\n", r.area());
}
