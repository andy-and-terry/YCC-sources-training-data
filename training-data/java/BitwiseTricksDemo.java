public class BitwiseTricksDemo {
    static boolean isPowerOfTwo(int n) { return n > 0 && (n & (n - 1)) == 0; }

    static int reverseBits(int n) { return Integer.reverse(n); }

    public static void main(String[] args) {
        int x = 0b101100;
        System.out.println(Integer.bitCount(x) + " " + Integer.numberOfTrailingZeros(x));
        System.out.println(Integer.toBinaryString(x & -x));
        System.out.println(isPowerOfTwo(64) + " " + isPowerOfTwo(100));
        System.out.println(-16 >> 2);
        System.out.println(-16 >>> 28);
        System.out.println(Integer.toHexString(reverseBits(1)));
        System.out.println(Integer.highestOneBit(100) + " " + Long.numberOfLeadingZeros(1L));
        int a = 5, b = 9;
        a ^= b; b ^= a; a ^= b;
        System.out.println(a + " " + b);
    }
}
