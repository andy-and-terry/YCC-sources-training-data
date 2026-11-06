// Amicable pairs: d(a) == b and d(b) == a with a != b.
public class AmicablePairs {
    static Integer d(Integer n) {
        Integer s = 0;
        for (Integer i = 1; i < n; i++) {
            if (Math.mod(n, i) == 0) s += i;
        }
        return s;
    }

    public static void run() {
        for (Integer a = 2; a < 1500; a++) {
            Integer b = d(a);
            if (b > a && d(b) == a) System.debug(a + ' ' + b);
        }
    }
}
