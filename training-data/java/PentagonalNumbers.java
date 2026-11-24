// Pentagonal numbers: n(3n-1)/2.
public class PentagonalNumbers {
    public static void main(String[] args) {
        for (int n = 1; n <= 10; n++) System.out.print(n * (3 * n - 1) / 2 + " ");
        System.out.println();
    }
}
