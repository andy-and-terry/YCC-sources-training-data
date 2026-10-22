public class PolygonalNumbers {
    // s-gonal number: P(s, n) = ((s - 2) * n^2 - (s - 4) * n) / 2
    public static Integer polygonal(Integer s, Integer n) {
        Integer twice = (s - 2) * n * n - (s - 4) * n;
        return Integer.valueOf(Math.floor(twice / 2.0));
    }

    public static List<Integer> firstTen(Integer s) {
        List<Integer> result = new List<Integer>();
        for (Integer n = 1; n <= 10; n++) {
            result.add(polygonal(s, n));
        }
        return result;
    }

    public static void main() {
        System.debug('Triangular: ' + firstTen(3));
        System.debug('Pentagonal: ' + firstTen(5));
        System.debug('Hexagonal: ' + firstTen(6));
    }
}
