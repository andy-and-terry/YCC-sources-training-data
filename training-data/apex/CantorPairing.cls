// Cantor pairing function and its inverse.
public class CantorPairing {
    public static Long pair(Long x, Long y) {
        return (x + y) * (x + y + 1) / 2 + y;
    }

    public static List<Long> unpair(Long z) {
        Long w = ((Math.sqrt(8.0 * z + 1) - 1) / 2).longValue();
        Long y = z - w * (w + 1) / 2;
        return new List<Long>{ w - y, y };
    }

    public static void run() {
        System.debug(pair(3, 4));
        List<Long> p = unpair(32);
        System.debug(p[0] + ' ' + p[1]);
    }
}
