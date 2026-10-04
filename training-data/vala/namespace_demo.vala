namespace Geometry {
    public const double EPSILON = 1e-9;

    public struct Point {
        public double x;
        public double y;

        public Point(double x, double y) {
            this.x = x;
            this.y = y;
        }

        public double distance_to(Point other) {
            double dx = x - other.x;
            double dy = y - other.y;
            return Math.sqrt(dx * dx + dy * dy);
        }
    }

    public double perimeter(Point[] points) {
        double total = 0;
        for (int i = 0; i < points.length; i++) {
            total += points[i].distance_to(points[(i + 1) % points.length]);
        }
        return total;
    }

    namespace Util {
        public bool nearly_equal(double a, double b) {
            return Math.fabs(a - b) < EPSILON;
        }
    }
}

namespace Text {
    public string banner(string title) {
        return "== %s ==".printf(title);
    }
}

using Geometry;

void main() {
    stdout.printf("%s\n", Text.banner("Triangle"));
    Point[] tri = { Point(0, 0), Point(3, 0), Point(3, 4) };
    stdout.printf("perimeter = %.1f\n", perimeter(tri));
    stdout.printf("%s\n", Geometry.Util.nearly_equal(0.1 + 0.2, 0.3).to_string());
    stdout.printf("%s\n", Util.nearly_equal(1.0, 1.1).to_string());
}
