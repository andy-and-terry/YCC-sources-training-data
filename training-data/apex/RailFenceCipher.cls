public class RailFenceCipher {
    public static String encode(String s, Integer rails) {
        List<String> rows = new List<String>();
        for (Integer i = 0; i < rails; i++) rows.add('');
        Integer r = 0, dir = 1;
        for (Integer i = 0; i < s.length(); i++) {
            rows[r] += s.substring(i, i + 1);
            if (r == 0) dir = 1;
            if (r == rails - 1) dir = -1;
            r += dir;
        }
        return String.join(rows, '');
    }
}
