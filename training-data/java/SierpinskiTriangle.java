public class SierpinskiTriangle {
    public static void main(String[] args) {
        int n = 8;
        for (int r = 0; r < n; r++) {
            StringBuilder sb = new StringBuilder(" ".repeat(n - r - 1));
            for (int c = 0; c <= r; c++) sb.append((r & c) == c ? "* " : "  ");
            System.out.println(sb);
        }
    }
}
