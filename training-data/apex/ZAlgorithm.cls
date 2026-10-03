public class ZAlgorithm {
    public static List<Integer> buildZArray(String s) {
        Integer n = s.length();
        List<Integer> z = new List<Integer>();
        for (Integer i = 0; i < n; i++) {
            z.add(0);
        }
        Integer left = 0;
        Integer right = 0;
        for (Integer i = 1; i < n; i++) {
            if (i < right) {
                z[i] = Math.min(right - i, z[i - left]);
            }
            while (i + z[i] < n && s.charAt(z[i]) == s.charAt(i + z[i])) {
                z[i]++;
            }
            if (i + z[i] > right) {
                left = i;
                right = i + z[i];
            }
        }
        return z;
    }

    public static Integer search(String text, String pattern) {
        String combined = pattern + '$' + text;
        List<Integer> z = buildZArray(combined);
        for (Integer i = 0; i < z.size(); i++) {
            if (z[i] == pattern.length()) {
                return i - pattern.length() - 1;
            }
        }
        return -1;
    }

    public static void main() {
        System.debug(search('abxabcabcaby', 'abcaby'));
        System.debug(search('hello world', 'xyz'));
    }
}
