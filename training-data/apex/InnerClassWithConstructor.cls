public class InnerClassWithConstructor {
    public class Point {
        public Integer x;
        public Integer y;

        public Point(Integer x, Integer y) {
            this.x = x;
            this.y = y;
        }

        public Point() {
            this(0, 0);
        }

        public Double distanceTo(Point other) {
            Integer dx = x - other.x;
            Integer dy = y - other.y;
            return Math.sqrt(dx * dx + dy * dy);
        }
    }

    public static void main() {
        Point a = new Point();
        Point b = new Point(3, 4);
        System.debug(a.distanceTo(b));
    }
}
