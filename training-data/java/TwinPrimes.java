public class TwinPrimes {
    public static void main(String[] args) {
        int n = 50;
        boolean[] composite = new boolean[n + 1];
        for (int i = 2; i * i <= n; i++)
            if (!composite[i])
                for (int j = i * i; j <= n; j += i) composite[j] = true;
        StringBuilder sb = new StringBuilder();
        for (int p = 3; p + 2 <= n; p++)
            if (!composite[p] && !composite[p + 2]) sb.append("(").append(p).append(", ").append(p + 2).append(") ");
        System.out.println(sb);
    }
}
