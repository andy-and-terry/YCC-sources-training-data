public class MoserDeBruijn {
    // Read the binary digits of i as base-4 digits.
    public static Long moser(Integer i) {
        Long value = 0, power = 1;
        while (i > 0) {
            if (Math.mod(i, 2) == 1) value += power;
            power *= 4;
            i /= 2;
        }
        return value;
    }

    public static void run() {
        List<Long> out = new List<Long>();
        for (Integer i = 0; i < 10; i++) out.add(moser(i));
        System.debug(out); // (0, 1, 4, 5, 16, 17, 20, 21, 64, 65)
    }
}
