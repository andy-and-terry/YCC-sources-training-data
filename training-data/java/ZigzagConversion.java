public class ZigzagConversion {
    static String convert(String s, int rows) {
        if (rows == 1 || rows >= s.length()) return s;
        StringBuilder[] lines = new StringBuilder[rows];
        for (int i = 0; i < rows; i++) lines[i] = new StringBuilder();
        int row = 0, dir = 1;
        for (char c : s.toCharArray()) {
            lines[row].append(c);
            if (row == 0) dir = 1;
            else if (row == rows - 1) dir = -1;
            row += dir;
        }
        StringBuilder out = new StringBuilder();
        for (StringBuilder l : lines) out.append(l);
        return out.toString();
    }

    public static void main(String[] args) {
        System.out.println(convert("PAYPALISHIRING", 3));
        System.out.println(convert("PAYPALISHIRING", 4));
    }
}
