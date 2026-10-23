// Custom classes used as Set elements or Map keys need equals() and hashCode().
public class HashCodeEqualsKey {
    public class GridPoint {
        public Integer x;
        public Integer y;

        public GridPoint(Integer x, Integer y) {
            this.x = x;
            this.y = y;
        }

        public Boolean equals(Object other) {
            if (other == null || !(other instanceof GridPoint)) return false;
            GridPoint p = (GridPoint) other;
            return x == p.x && y == p.y;
        }

        public Integer hashCode() {
            return 31 * x + y;
        }
    }

    public static void main() {
        Set<GridPoint> visited = new Set<GridPoint>();
        visited.add(new GridPoint(1, 2));
        visited.add(new GridPoint(1, 2));   // duplicate, ignored
        visited.add(new GridPoint(2, 1));
        System.debug('set size: ' + visited.size());                           // 2
        System.debug('contains (2,1): ' + visited.contains(new GridPoint(2, 1))); // true

        Map<GridPoint, String> labels = new Map<GridPoint, String>();
        labels.put(new GridPoint(0, 0), 'origin');
        labels.put(new GridPoint(0, 0), 'ORIGIN');   // replaces the value
        System.debug('map size: ' + labels.size());                            // 1
        System.debug('label: ' + labels.get(new GridPoint(0, 0)));             // ORIGIN
    }
}
