public class HammingDistance {
    public static int of(String a, String b) {
        if (a.length() != b.length()) throw new IllegalArgumentException("strings must have equal length");
        int d = 0;
        for (int i = 0; i < a.length(); i++) if (a.charAt(i) != b.charAt(i)) d++;
        return d;
    }

    public static int of(long x, long y) {
        return Long.bitCount(x ^ y);
    }

    /** Sum of Hamming distances over all pairs, computed per bit in O(32n). */
    public static long totalPairwise(int[] nums) {
        long total = 0;
        for (int bit = 0; bit < 32; bit++) {
            int ones = 0;
            for (int x : nums) ones += (x >>> bit) & 1;
            total += (long) ones * (nums.length - ones);
        }
        return total;
    }

    public static void main(String[] args) {
        System.out.println(of("karolin", "kathrin") + " " + of(1, 4) + " " + totalPairwise(new int[] {4, 14, 2}));
    }
}
