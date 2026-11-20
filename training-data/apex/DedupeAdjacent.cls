// Remove consecutive duplicate characters.
public class DedupeAdjacent {
    public static String dedupe(String s) {
        String out = '';
        for (Integer i = 0; i < s.length(); i++) {
            if (i == 0 || s.substring(i, i + 1) != s.substring(i - 1, i)) { out += s.substring(i, i + 1); }
        }
        return out;
    }
}
