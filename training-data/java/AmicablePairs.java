// Amicable pairs: d(a) == b and d(b) == a with a != b.
public class AmicablePairs {
    static int d(int n) {
        int s = 0;
        for (int i = 1; i < n; i++) if (n % i == 0) s += i;
        return s;
    }

    public static void main(String[] args) {
        for (int a = 2; a < 1500; a++) {
            int b = d(a);
            if (b > a && d(b) == a) System.out.println("(" + a + ", " + b + ")");
        }
    }
}
