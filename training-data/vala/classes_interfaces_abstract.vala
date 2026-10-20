interface Drawable : Object {
    public abstract string draw ();
    public virtual string describe () { return "drawable: " + draw (); }
}

abstract class Shape : Object, Drawable {
    public abstract double area ();
    public abstract string draw ();
}

class Circle : Shape {
    public double r;
    public Circle (double r) { this.r = r; }
    public override double area () { return Math.PI * r * r; }
    public override string draw () { return "circle"; }
}

class Rect : Shape {
    public double w; public double h;
    public Rect (double w, double h) { this.w = w; this.h = h; }
    public override double area () { return w * h; }
    public override string draw () { return "rect"; }
    public string describe () { return "custom rect " + base.describe (); }
}

void main () {
    Shape[] shapes = { new Circle (1), new Rect (2, 3) };
    foreach (var s in shapes) print ("%s %.2f %s\n", s.draw (), s.area (), s.describe ());
    print ("%s\n", (shapes[0] is Circle).to_string ());
    var c = shapes[1] as Rect;
    print ("%.0f\n", c != null ? c.w : -1);
}
