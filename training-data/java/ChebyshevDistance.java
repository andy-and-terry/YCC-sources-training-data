public class ChebyshevDistance {
    static int chebyshev(int[] a, int[] b) {
        int m = 0;
        for (int i = 0; i < a.length; i++) m = Math.max(m, Math.abs(a[i] - b[i]));
        return m;
    }

    public static void main(String[] args) {
        System.out.println(chebyshev(new int[]{1, 2}, new int[]{4, 6}));
    }
}
