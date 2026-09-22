struct Point {
    public double x;
    public double y;

    public string to_string() {
        return "(%.1f, %.1f)".printf(x, y);
    }
}

Point add_points(Point a, Point b) {
    Point result = { a.x + b.x, a.y + b.y };
    return result;
}

void main() {
    Point p1 = { 1.0, 2.0 };
    Point p2 = { 3.0, 4.0 };
    Point p3 = add_points(p1, p2);
    stdout.printf("%s\n", p3.to_string());

    Point[] points = { p1, p2, p3 };
    foreach (Point p in points) {
        stdout.printf("%s\n", p.to_string());
    }
}
