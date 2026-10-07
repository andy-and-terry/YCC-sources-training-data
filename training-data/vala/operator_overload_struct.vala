struct Vec2 {
    public double x;
    public double y;

    public Vec2 (double x, double y) {
        this.x = x;
        this.y = y;
    }

    public Vec2 add (Vec2 other) {
        return Vec2 (x + other.x, y + other.y);
    }

    public Vec2 scale (double k) {
        return Vec2 (x * k, y * k);
    }

    public double length () {
        return Math.sqrt (x * x + y * y);
    }

    public string to_string () {
        return "(%.1f, %.1f)".printf (x, y);
    }
}

void main () {
    var a = Vec2 (3, 4);
    var b = Vec2 (1, 2);
    stdout.printf ("%s\n", a.add (b).to_string ());
    stdout.printf ("%s\n", a.scale (2).to_string ());
    stdout.printf ("%.2f\n", a.length ());
}
