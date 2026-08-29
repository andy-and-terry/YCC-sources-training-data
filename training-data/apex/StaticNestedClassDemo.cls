public class StaticNestedClassDemo {
    public class Point {
        public Integer x;
        public Integer y;

        public Point(Integer x, Integer y) {
            this.x = x;
            this.y = y;
        }

        public Double distanceTo(Point other) {
            Integer dx = this.x - other.x;
            Integer dy = this.y - other.y;
            return Math.sqrt(dx * dx + dy * dy);
        }
    }

    public static void main() {
        Point p1 = new Point(0, 0);
        Point p2 = new Point(3, 4);
        System.debug(p1.distanceTo(p2));
    }
}
