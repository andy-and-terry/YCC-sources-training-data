struct Point {
    public int x;
    public int y;

    public Point (int x, int y) {
        this.x = x;
        this.y = y;
    }

    public double distance_to (Point other) {
        double dx = other.x - x;
        double dy = other.y - y;
        return Math.sqrt (dx * dx + dy * dy);
    }
}

void main () {
    var a = Point (0, 0);
    var b = a;          // structs are copied on assignment
    b.x = 3;
    b.y = 4;

    print ("a = (%d, %d)\n", a.x, a.y);
    print ("b = (%d, %d)\n", b.x, b.y);
    print ("distance = %.1f\n", a.distance_to (b));
}
