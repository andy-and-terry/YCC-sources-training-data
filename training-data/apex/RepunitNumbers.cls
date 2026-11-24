// Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
public class RepunitNumbers {
    public static void run() {
        Long r = 0;
        for (Integer n = 1; n <= 8; n++) {
            r = r * 10 + 1;
            System.debug(String.valueOf(r) + (Math.mod(r, 3) == 0 ? '  (divisible by 3)' : ''));
        }
    }
}
