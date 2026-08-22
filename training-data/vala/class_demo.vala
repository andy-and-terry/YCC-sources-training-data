public class Point : Object {
    public double x { get; set; }
    public double y { get; set; }

    public Point(double x, double y) {
        this.x = x;
        this.y = y;
    }

    public Point add(Point other) {
        return new Point(x + other.x, y + other.y);
    }

    public string to_string() {
        return "(%.1f, %.1f)".printf(x, y);
    }
}

void main() {
    var p1 = new Point(1.0, 2.0);
    var p2 = new Point(3.0, 4.0);
    var p3 = p1.add(p2);
    stdout.printf("%s\n", p3.to_string());
}
