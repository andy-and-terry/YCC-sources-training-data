public class RecordCompactConstructorEx {
    record Range(int lo, int hi) {
        Range {
            if (lo > hi) throw new IllegalArgumentException("lo > hi: " + lo + " > " + hi);
        }
        int length() { return hi - lo; }
        static Range of(int a, int b) { return new Range(Math.min(a, b), Math.max(a, b)); }
    }

    public static void main(String[] args) {
        System.out.println(Range.of(9, 3));
        System.out.println(new Range(1, 5).length());
        try { new Range(5, 1); } catch (IllegalArgumentException e) { System.out.println(e.getMessage()); }
    }
}
