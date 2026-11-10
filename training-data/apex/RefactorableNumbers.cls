public class RefactorableNumbers {
    public static Integer tau(Integer n) {
        Integer c = 0;
        for (Integer d = 1; d <= n; d++) if (Math.mod(n, d) == 0) c++;
        return c;
    }

    public static void run() {
        List<Integer> out = new List<Integer>();
        for (Integer n = 1; n < 60; n++) if (Math.mod(n, tau(n)) == 0) out.add(n);
        System.debug(out); // (1, 2, 8, 9, 12, 18, 24, 36, 40, 56)
    }
}
