// Narayana's cows: N(0) = N(1) = N(2) = 1, N(n) = N(n-1) + N(n-3)
public class NarayanaCowsSequence {
    public static void main(String[] args) {
        long[] n = new long[15];
        n[0] = n[1] = n[2] = 1;
        for (int i = 3; i < n.length; i++) n[i] = n[i - 1] + n[i - 3];
        StringBuilder sb = new StringBuilder();
        for (long v : n) sb.append(v).append(' ');
        System.out.println(sb.toString().trim());
    }
}
