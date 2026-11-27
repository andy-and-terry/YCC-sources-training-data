public class RailFenceCipher {
    public static String encode(String text, Integer rails) {
        List<String> rows = new List<String>();
        for (Integer i = 0; i < rails; i++) rows.add('');
        Integer r = 0, step = 1;
        for (Integer i = 0; i < text.length(); i++) {
            rows[r] += text.substring(i, i + 1);
            if (r == 0) step = 1;
            else if (r == rails - 1) step = -1;
            r += step;
        }
        return String.join(rows, '');
    }

    public static void demo() {
        System.debug(encode('WEAREDISCOVERED', 3));
    }
}
