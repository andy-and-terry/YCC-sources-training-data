public class RecordCompactConstructor {
    record Range(int lo, int hi) {
        Range {
            if (lo > hi) throw new IllegalArgumentException("lo > hi");
        }
        int length() { return hi - lo; }
    }

    public static void main(String[] args) {
        System.out.println(new Range(2, 7).length());
        try { new Range(5, 1); } catch (IllegalArgumentException e) { System.out.println(e.getMessage()); }
    }
}
