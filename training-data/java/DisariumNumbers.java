// Disarium numbers: digits raised to their 1-based positions sum to n.
public class DisariumNumbers {
    static boolean isDisarium(int n) {
        String s = String.valueOf(n);
        int sum = 0;
        for (int i = 0; i < s.length(); i++) sum += (int) Math.round(Math.pow(s.charAt(i) - '0', i + 1));
        return sum == n;
    }

    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        for (int n = 1; n < 1000; n++) if (isDisarium(n)) sb.append(n).append(' ');
        System.out.println(sb.toString().trim());
    }
}
