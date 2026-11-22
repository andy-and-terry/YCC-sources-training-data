// Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
public class LazyCatererNumbers {
    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        for (int n = 0; n < 10; n++) sb.append(n * (n + 1) / 2 + 1).append(' ');
        System.out.println(sb.toString().trim());
    }
}
