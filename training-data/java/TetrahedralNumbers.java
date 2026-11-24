// Tetrahedral numbers: n(n+1)(n+2)/6.
public class TetrahedralNumbers {
    public static void main(String[] args) {
        for (int n = 1; n <= 10; n++) System.out.print(n * (n + 1) * (n + 2) / 6 + " ");
        System.out.println();
    }
}
