public class BitReversal {
    static int reverse8(int v) {
        return Integer.reverse(v) >>> 24;
    }

    static int reverseLoop(int v) {
        int r = 0;
        for (int i = 0; i < 8; i++) {
            r = (r << 1) | (v & 1);
            v >>= 1;
        }
        return r;
    }

    public static void main(String[] args) {
        for (int v : new int[] {1, 6, 13, 128})
            System.out.println(v + " " + reverse8(v) + " " + reverseLoop(v)); // 128 96 176 1
    }
}
