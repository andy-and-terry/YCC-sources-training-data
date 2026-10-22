public class GolombSequence {
    // a(n) = 1 + a(n - a(a(n-1))), 1-based indexing
    static int[] golomb(int count) {
        int[] a = new int[count + 1];
        a[1] = 1;
        for (int n = 2; n <= count; n++) a[n] = 1 + a[n - a[a[n - 1]]];
        return a;
    }

    public static void main(String[] args) {
        int[] a = golomb(20);
        StringBuilder sb = new StringBuilder();
        for (int n = 1; n < a.length; n++) sb.append(a[n]).append(' ');
        System.out.println(sb.toString().trim());
    }
}
