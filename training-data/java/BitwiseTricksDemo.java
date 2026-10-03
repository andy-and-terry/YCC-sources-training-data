public class BitwiseTricksDemo {
    static int popcount(int n) {
        int count = 0;
        while (n != 0) {
            n &= (n - 1); // clears the lowest set bit
            count++;
        }
        return count;
    }

    static int lowestSetBit(int n) {
        return n & (-n);
    }

    static boolean isPowerOfTwo(int n) {
        return n > 0 && (n & (n - 1)) == 0;
    }

    static int[] xorSwap(int a, int b) {
        a ^= b;
        b ^= a;
        a ^= b;
        return new int[] {a, b};
    }

    public static void main(String[] args) {
        System.out.println("popcount(29): " + popcount(29));
        System.out.println("lowest set bit of 12: " + lowestSetBit(12));
        System.out.println("16 is power of two: " + isPowerOfTwo(16));
        System.out.println("18 is power of two: " + isPowerOfTwo(18));
        int[] swapped = xorSwap(5, 9);
        System.out.println("swapped: " + swapped[0] + ", " + swapped[1]);
    }
}
