// Cake numbers: max pieces from n plane cuts of a cube, (n^3 + 5n + 6) / 6.
public class CakeNumbers {
    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();
        for (int n = 0; n < 10; n++) sb.append((n * n * n + 5 * n + 6) / 6).append(' ');
        System.out.println(sb.toString().trim());
    }
}
