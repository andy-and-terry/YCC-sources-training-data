namespace Geometry {
    public const double PI_APPROX = 3.14159;

    public double circle_area(double r) {
        return PI_APPROX * r * r;
    }

    public class Point : Object {
        public double x { get; construct set; }
        public double y { get; construct set; }

        public Point(double x, double y) {
            Object(x: x, y: y);
        }

        public double distance_to(Point other) {
            return Math.sqrt(Math.pow(x - other.x, 2) + Math.pow(y - other.y, 2));
        }
    }

    namespace Util {
        public string format_point(Point p) {
            return "(%.1f, %.1f)".printf(p.x, p.y);
        }
    }
}

void main() {
    var a = new Geometry.Point(0, 0);
    var b = new Geometry.Point(3, 4);
    stdout.printf("%s -> %s : %.1f\n",
        Geometry.Util.format_point(a), Geometry.Util.format_point(b), a.distance_to(b));
    stdout.printf("%.2f\n", Geometry.circle_area(2));
}
