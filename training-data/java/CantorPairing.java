// Cantor pairing function and its inverse.
public class CantorPairing {
    static long pair(long x, long y) {
        return (x + y) * (x + y + 1) / 2 + y;
    }

    static long[] unpair(long z) {
        long w = (long) ((Math.sqrt(8.0 * z + 1) - 1) / 2);
        long y = z - w * (w + 1) / 2;
        return new long[] {w - y, y};
    }

    public static void main(String[] args) {
        System.out.println(pair(3, 4));
        long[] p = unpair(32);
        System.out.println(p[0] + " " + p[1]);
    }
}
