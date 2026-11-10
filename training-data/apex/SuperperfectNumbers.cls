public class SuperperfectNumbers {
    public static Integer sigma(Integer n) {
        Integer s = 0;
        for (Integer d = 1; d <= n; d++) if (Math.mod(n, d) == 0) s += d;
        return s;
    }

    public static void run() {
        List<Integer> out = new List<Integer>();
        for (Integer n = 1; n < 100; n++) if (sigma(sigma(n)) == 2 * n) out.add(n);
        System.debug(out); // (2, 4, 16, 64)
    }
}
