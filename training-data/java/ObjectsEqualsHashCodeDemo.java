import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

public class ObjectsEqualsHashCodeDemo {
    static final class Point {
        private final int x, y;

        Point(int x, int y) {
            this.x = x;
            this.y = y;
        }

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (!(o instanceof Point other)) return false;
            return x == other.x && y == other.y;
        }

        @Override
        public int hashCode() {
            return Objects.hash(x, y);
        }

        @Override
        public String toString() {
            return "(" + x + "," + y + ")";
        }
    }

    public static void main(String[] args) {
        Set<Point> set = new HashSet<>();
        set.add(new Point(1, 2));
        set.add(new Point(1, 2));
        set.add(new Point(3, 4));
        System.out.println(set.size() + " " + set.contains(new Point(3, 4)));

        System.out.println(Objects.equals(null, null));
        System.out.println(Objects.requireNonNullElse(null, "default"));
        System.out.println(Objects.toString(null, "none"));
    }
}
