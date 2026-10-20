public class StringUtilsApex {
    public static String titleCase(String s) {
        if (String.isBlank(s)) return s;
        List<String> parts = s.toLowerCase().split('\\s+');
        for (Integer i = 0; i < parts.size(); i++) parts[i] = parts[i].capitalize();
        return String.join(parts, ' ');
    }

    public static Boolean isPalindrome(String s) {
        String cleaned = s.toLowerCase().replaceAll('[^a-z0-9]', '');
        return cleaned == cleaned.reverse();
    }

    public static String padLeft(String s, Integer width, String pad) {
        return s.leftPad(width, pad);
    }

    public static Map<String, Integer> wordCounts(String text) {
        Map<String, Integer> counts = new Map<String, Integer>();
        for (String w : text.toLowerCase().split('\\W+')) {
            if (String.isBlank(w)) continue;
            counts.put(w, counts.containsKey(w) ? counts.get(w) + 1 : 1);
        }
        return counts;
    }

    public static String format(String template, List<Object> args) {
        return String.format(template, args);
    }
}
