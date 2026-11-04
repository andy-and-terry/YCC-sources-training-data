public class ZigzagConvert {
    public static String zigzag(String s, Integer rows) {
        if (rows == 1 || rows >= s.length()) return s;
        List<String> lines = new List<String>();
        for (Integer i = 0; i < rows; i++) lines.add('');
        Integer r = 0;
        Integer step = 1;
        for (Integer i = 0; i < s.length(); i++) {
            lines[r] += s.substring(i, i + 1);
            if (r == 0) step = 1;
            else if (r == rows - 1) step = -1;
            r += step;
        }
        return String.join(lines, '');
    }
}
