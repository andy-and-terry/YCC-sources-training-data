public class ZigzagConvert {
    static String zigzag(String s, int rows) {
        if (rows == 1 || rows >= s.length()) return s;
        StringBuilder[] lines = new StringBuilder[rows];
        for (int i = 0; i < rows; i++) lines[i] = new StringBuilder();
        int r = 0, step = 1;
        for (char c : s.toCharArray()) {
            lines[r].append(c);
            if (r == 0) step = 1;
            else if (r == rows - 1) step = -1;
            r += step;
        }
        StringBuilder out = new StringBuilder();
        for (StringBuilder l : lines) out.append(l);
        return out.toString();
    }

    public static void main(String[] args) {
        System.out.println(zigzag("PAYPALISHIRING", 3));
    }
}
