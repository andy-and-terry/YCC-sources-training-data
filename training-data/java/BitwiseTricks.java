public class BitwiseTricks {
    static boolean isPowerOfTwo(int n) { return n > 0 && (n & (n - 1)) == 0; }

    static int swapBits(int x, int i, int j) {
        if (((x >> i) & 1) != ((x >> j) & 1)) x ^= (1 << i) | (1 << j);
        return x;
    }

    public static void main(String[] args) {
        System.out.println(isPowerOfTwo(64) + " " + isPowerOfTwo(65));
        System.out.println(Integer.bitCount(0b101101));
        System.out.println(Integer.toBinaryString(swapBits(0b0110, 0, 3)));
        System.out.println(-16 >> 2);
        System.out.println(-16 >>> 28);
        System.out.println(Integer.highestOneBit(100) + " " + Integer.numberOfTrailingZeros(40));
    }
}
