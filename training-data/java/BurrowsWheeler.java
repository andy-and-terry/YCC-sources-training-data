import java.util.Arrays;

public class BurrowsWheeler {
    public static void main(String[] args) {
        String s = "banana$";
        int n = s.length();
        String[] rots = new String[n];
        for (int i = 0; i < n; i++) rots[i] = s.substring(i) + s.substring(0, i);
        Arrays.sort(rots);
        StringBuilder sb = new StringBuilder();
        for (String r : rots) sb.append(r.charAt(n - 1));
        System.out.println(sb);
    }
}
