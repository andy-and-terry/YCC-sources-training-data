import java.util.HashMap;
import java.util.Map;

public class LongestSubstringNoRepeat {
    public static String longest(String s) {
        Map<Character, Integer> last = new HashMap<>();
        int start = 0, bestStart = 0, bestLen = 0;
        for (int i = 0; i < s.length(); i++) {
            Integer prev = last.put(s.charAt(i), i);
            if (prev != null && prev >= start) start = prev + 1;
            if (i - start + 1 > bestLen) {
                bestLen = i - start + 1;
                bestStart = start;
            }
        }
        return s.substring(bestStart, bestStart + bestLen);
    }

    public static void main(String[] args) {
        for (String s : new String[] {"abcabcbb", "bbbbb", "pwwkew", "dvdf"}) {
            String r = longest(s);
            System.out.println(s + " " + r + " " + r.length());
        }
    }
}
