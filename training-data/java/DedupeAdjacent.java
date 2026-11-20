// Remove consecutive duplicate characters with a StringBuilder.
public class DedupeAdjacent {
    static String dedupe(String s) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < s.length(); i++)
            if (i == 0 || s.charAt(i) != s.charAt(i - 1)) sb.append(s.charAt(i));
        return sb.toString();
    }

    public static void main(String[] args) {
        System.out.println(dedupe("aabbbcdd"));
    }
}
