import java.util.List;

public class RecordsDemo {
    record Point(int x, int y) {
        Point {
            if (x < 0 || y < 0) throw new IllegalArgumentException("coordinates must be non-negative");
        }

        double distanceTo(Point other) {
            return Math.sqrt(Math.pow(x - other.x, 2) + Math.pow(y - other.y, 2));
        }
    }

    record Rectangle(Point topLeft, Point bottomRight) {
        int area() {
            int width = bottomRight.x() - topLeft.x();
            int height = bottomRight.y() - topLeft.y();
            return width * height;
        }
    }

    public static void main(String[] args) {
        Point a = new Point(0, 0);
        Point b = new Point(3, 4);
        System.out.println(a.distanceTo(b));

        Rectangle rect = new Rectangle(new Point(0, 0), new Point(4, 5));
        System.out.println(rect.area());
        System.out.println(rect);

        List<Point> points = List.of(a, b);
        System.out.println(points);
    }
}
