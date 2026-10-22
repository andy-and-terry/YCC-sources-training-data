// Perrin numbers: P(0) = 3, P(1) = 0, P(2) = 2, P(n) = P(n-2) + P(n-3)
public class PerrinNumbers {
    public static void main(String[] args) {
        long[] p = new long[15];
        p[0] = 3;
        p[1] = 0;
        p[2] = 2;
        for (int n = 3; n < p.length; n++) p[n] = p[n - 2] + p[n - 3];
        StringBuilder sb = new StringBuilder();
        for (long v : p) sb.append(v).append(' ');
        System.out.println(sb.toString().trim());
    }
}
