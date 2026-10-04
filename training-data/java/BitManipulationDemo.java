public class BitManipulationDemo {
    static boolean isSet(int n, int bit) { return (n >> bit & 1) == 1; }

    static int setBit(int n, int bit) { return n | (1 << bit); }

    static int clearBit(int n, int bit) { return n & ~(1 << bit); }

    static int toggleBit(int n, int bit) { return n ^ (1 << bit); }

    static boolean isPowerOfTwo(int n) { return n > 0 && (n & (n - 1)) == 0; }

    public static void main(String[] args) {
        int n = 0b1011_0010;
        System.out.println(Integer.toBinaryString(n));
        System.out.println(isSet(n, 4) + " " + isSet(n, 2));
        System.out.println(Integer.toBinaryString(setBit(n, 0)));
        System.out.println(Integer.toBinaryString(clearBit(n, 7)));
        System.out.println(Integer.toBinaryString(toggleBit(n, 1)));

        System.out.println("bit count: " + Integer.bitCount(n));
        System.out.println("lowest set bit: " + Integer.lowestOneBit(n));
        System.out.println("leading zeros: " + Integer.numberOfLeadingZeros(n));
        System.out.println("trailing zeros: " + Integer.numberOfTrailingZeros(n));
        System.out.println("highest bit: " + Integer.highestOneBit(n));

        System.out.println(-16 >> 2);
        System.out.println(-16 >>> 28);
        System.out.println(isPowerOfTwo(64) + " " + isPowerOfTwo(65));
        System.out.println(Integer.reverse(1) == Integer.MIN_VALUE);
    }
}
