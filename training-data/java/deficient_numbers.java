// Deficient numbers below 100; expect 76.
public class DeficientNumbers {
    static int properSum(int n) {
        int t = 0;
        for (int d = 1; d < n; d++) if (n % d == 0) t += d;
        return t;
    }

    public static void main(String[] args) {
        int c = 0;
        for (int n = 1; n < 100; n++) if (properSum(n) < n) c++;
        System.out.println(c);
    }
}
