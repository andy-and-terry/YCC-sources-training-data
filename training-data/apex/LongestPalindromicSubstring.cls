public class LongestPalindromicSubstring {
    private static Integer expand(String s, Integer left, Integer right) {
        while (left >= 0 && right < s.length() && s.charAt(left) == s.charAt(right)) {
            left--;
            right++;
        }
        return right - left - 1;
    }

    public static String find(String s) {
        if (String.isBlank(s)) {
            return '';
        }
        Integer bestStart = 0;
        Integer bestLen = 1;
        for (Integer i = 0; i < s.length(); i++) {
            Integer odd = expand(s, i, i);
            Integer even = expand(s, i, i + 1);
            Integer len = Math.max(odd, even);
            if (len > bestLen) {
                bestLen = len;
                bestStart = i - (len - 1) / 2;
            }
        }
        return s.substring(bestStart, bestStart + bestLen);
    }

    public static void main() {
        System.debug(find('babad'));
        System.debug(find('cbbd'));
    }
}
