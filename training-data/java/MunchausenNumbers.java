// Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
public class MunchausenNumbers {
    static boolean isMunchausen(int n) {
        int sum = 0;
        for (int m = n; m > 0; m /= 10) {
            int d = m % 10, p = d == 0 ? 0 : 1;
            for (int i = 0; i < d; i++) p *= d;
            sum += p;
        }
        return sum == n;
    }

    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        for (int n = 1; n < 5000; n++) if (isMunchausen(n)) sb.append(n).append(' ');
        System.out.println(sb.toString().trim());
    }
}
