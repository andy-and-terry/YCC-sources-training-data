// Hexagonal numbers: n(2n-1).
public class HexagonalNumbers {
    public static void run() {
        List<Integer> out = new List<Integer>();
        for (Integer n = 1; n <= 10; n++) out.add(n * (2 * n - 1));
        System.debug(String.join(out, ' '));
    }
}
