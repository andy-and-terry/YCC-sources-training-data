public class InterleaveStrings {
    public static String interleave(List<String> parts) {
        Integer longest = 0;
        for (String p : parts) longest = Math.max(longest, p.length());
        String out = '';
        for (Integer i = 0; i < longest; i++) {
            for (String p : parts) {
                if (i < p.length()) out += p.substring(i, i + 1);
            }
        }
        return out;
    }
}
