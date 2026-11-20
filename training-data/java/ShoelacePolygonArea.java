// Shoelace polygon area using a record for points.
public class ShoelacePolygonArea {
    record Point(double x, double y) {}

    static double area(Point[] p) {
        double s = 0;
        for (int i = 0; i < p.length; i++) {
            Point q = p[(i + 1) % p.length];
            s += p[i].x() * q.y() - q.x() * p[i].y();
        }
        return Math.abs(s) / 2;
    }

    public static void main(String[] args) {
        System.out.println(area(new Point[]{new Point(0, 0), new Point(4, 0), new Point(4, 3), new Point(0, 3)}));
    }
}
