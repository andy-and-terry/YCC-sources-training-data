// Squarefree numbers up to 100; expect 61.
public class SquarefreeNumbers {
    static Boolean squarefree(Integer n) {
        for (Integer d = 2; d * d <= n; d++) {
            if (Math.mod(n, d * d) == 0) return false;
        }
        return true;
    }

    public static void run() {
        Integer c = 0;
        for (Integer n = 1; n <= 100; n++) {
            if (squarefree(n)) c++;
        }
        System.debug(c);
    }
}
