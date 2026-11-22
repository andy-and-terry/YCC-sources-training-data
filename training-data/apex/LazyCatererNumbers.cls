// Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
public class LazyCatererNumbers {
    public static void run() {
        List<Integer> out = new List<Integer>();
        for (Integer n = 0; n < 10; n++) {
            out.add(n * (n + 1) / 2 + 1);
        }
        System.debug(String.join(out, ' '));
    }
}
