// Repunits: R_k = (10^k - 1) / 9, built as r = 10r + 1.
public class RepunitNumbers {
    public static void run() {
        Long r = 0;
        List<Long> out = new List<Long>();
        for (Integer i = 0; i < 8; i++) {
            r = r * 10 + 1;
            out.add(r);
        }
        System.debug(String.join(out, ' '));
    }
}
