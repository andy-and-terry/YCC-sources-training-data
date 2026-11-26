// Squarefree numbers up to 100; expect 61.
public class SquarefreeNumbers {
    static boolean squarefree(int n) {
        for (int d = 2; d * d <= n; d++) if (n % (d * d) == 0) return false;
        return true;
    }

    public static void main(String[] args) {
        int c = 0;
        for (int n = 1; n <= 100; n++) if (squarefree(n)) c++;
        System.out.println(c);
    }
}
