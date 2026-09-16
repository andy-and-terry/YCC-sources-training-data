public class RabinKarpSearch {
    private static final Integer BASE = 26;
    private static final String ALPHABET = 'abcdefghijklmnopqrstuvwxyz';

    private static Integer charCode(String s, Integer index) {
        return ALPHABET.indexOf(s.substring(index, index + 1)) + 1;
    }

    public static Integer search(String text, String pattern) {
        Integer n = text.length();
        Integer m = pattern.length();
        if (m > n) {
            return -1;
        }

        Long patternHash = 0;
        Long windowHash = 0;
        Long highOrder = 1;
        for (Integer i = 0; i < m - 1; i++) {
            highOrder = highOrder * BASE;
        }

        for (Integer i = 0; i < m; i++) {
            patternHash = patternHash * BASE + charCode(pattern, i);
            windowHash = windowHash * BASE + charCode(text, i);
        }

        Integer i = 0;
        while (true) {
            if (patternHash == windowHash && text.substring(i, i + m) == pattern) {
                return i;
            }
            if (i + m >= n) {
                return -1;
            }
            windowHash = (windowHash - charCode(text, i) * highOrder) * BASE + charCode(text, i + m);
            i++;
        }
    }

    public static void main() {
        System.debug(search('abxabcabcaby', 'abcaby'));
        System.debug(search('hello', 'xyz'));
    }
}
