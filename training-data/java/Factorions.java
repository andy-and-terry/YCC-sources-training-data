public class Factorions {
    public static void main(String[] args) {
        int[] fact = {1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880};
        for (int n = 1; n < 50000; n++) {
            int s = 0;
            for (int m = n; m > 0; m /= 10) s += fact[m % 10];
            if (s == n) System.out.print(n + " ");
        }
        System.out.println(); // 1 2 145 40585
    }
}
