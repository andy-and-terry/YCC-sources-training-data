class Rectangle : Object {
    public double width;
    public double height;

    public Rectangle (double w, double h) {
        width = w;
        height = h;
    }

    public Rectangle.square (double side) {
        this (side, side);
    }

    public Rectangle.from_string (string spec) {
        var parts = spec.split ("x");
        this (double.parse (parts[0]), double.parse (parts[1]));
    }

    public double area () {
        return width * height;
    }
}

void main () {
    stdout.printf ("%.1f\n", new Rectangle (2, 3).area ());
    stdout.printf ("%.1f\n", new Rectangle.square (4).area ());
    stdout.printf ("%.1f\n", new Rectangle.from_string ("2.5x4").area ());
}
