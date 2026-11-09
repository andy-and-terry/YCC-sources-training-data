interface Shape : Object {
    public abstract double area ();
}

class Square : Object, Shape {
    public double side { get; set; }
    public Square (double s) { side = s; }
    public double area () { return side * side; }
}

void main () {
    Shape s = new Square (3);
    print ("%.1f\n", s.area ());
}
