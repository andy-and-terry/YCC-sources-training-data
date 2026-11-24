// Pentagonal numbers: n(3n-1)/2.
public class PentagonalNumbers {
    public static void run() {
        List<Integer> out = new List<Integer>();
        for (Integer n = 1; n <= 10; n++) out.add(n * (3 * n - 1) / 2);
        System.debug(String.join(out, ' '));
    }
}
