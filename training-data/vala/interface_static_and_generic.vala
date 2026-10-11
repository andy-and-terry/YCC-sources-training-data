interface Shape : Object {
    public abstract double area ();
    public abstract string name { get; }

    public string describe () {
        return "%s with area %.2f".printf (name, area ());
    }
}

class Circle : Object, Shape {
    public double r;
    public string name { get { return "circle"; } }
    public Circle (double r) { this.r = r; }
    public double area () { return Math.PI * r * r; }
}

class Rect : Object, Shape {
    public double w;
    public double h;
    public string name { get { return "rect"; } }
    public Rect (double w, double h) { this.w = w; this.h = h; }
    public double area () { return w * h; }
}

void main () {
    Shape[] shapes = { new Circle (1.5), new Rect (2, 3) };
    foreach (var s in shapes) {
        stdout.printf ("%s\n", s.describe ());
    }
}
