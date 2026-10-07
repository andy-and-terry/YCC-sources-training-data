public class BinaryGap {
    static int binaryGap(int n) {
        int best = 0, last = -1;
        for (int i = 0; n > 0; i++, n >>>= 1) {
            if ((n & 1) == 1) {
                if (last >= 0) best = Math.max(best, i - last - 1);
                last = i;
            }
        }
        return best;
    }

    public static void main(String[] args) {
        for (int n : new int[] {9, 529, 20, 15, 1041}) {
            System.out.println(n + " " + Integer.toBinaryString(n) + " " + binaryGap(n));
        }
    }
}
