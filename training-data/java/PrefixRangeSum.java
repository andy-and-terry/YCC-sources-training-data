public class PrefixRangeSum {
    private final long[] prefix;

    PrefixRangeSum(int[] values) {
        prefix = new long[values.length + 1];
        for (int i = 0; i < values.length; i++) prefix[i + 1] = prefix[i] + values[i];
    }

    long query(int lo, int hi) {
        return prefix[hi] - prefix[lo];
    }

    public static void main(String[] args) {
        PrefixRangeSum rs = new PrefixRangeSum(new int[] {3, 1, 4, 1, 5, 9, 2, 6});
        System.out.println(rs.query(2, 5));
    }
}
