public class HammingWeight {
    public static Integer popcount(Long n) {
        Integer c = 0;
        while (n != 0) {
            n = n & (n - 1);
            c++;
        }
        return c;
    }

    public static void demo() {
        System.debug(popcount(183L));
    }
}
