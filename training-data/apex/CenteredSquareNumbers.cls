// Centered square numbers: n^2 + (n+1)^2.
public class CenteredSquareNumbers {
    public static void run() {
        List<Integer> out = new List<Integer>();
        for (Integer n = 0; n < 10; n++) out.add(n * n + (n + 1) * (n + 1));
        System.debug(String.join(out, ' '));
    }
}
