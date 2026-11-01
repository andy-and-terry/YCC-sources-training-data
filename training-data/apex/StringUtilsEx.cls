public class StringUtilsEx {
    public static String titleCase(String s) {
        List<String> parts = new List<String>();
        for (String w : s.split(' ')) {
            parts.add(w.capitalize());
        }
        return String.join(parts, ' ');
    }

    public static Boolean isPalindrome(String s) {
        String clean = s.toLowerCase().replaceAll('[^a-z0-9]', '');
        return clean == clean.reverse();
    }
}
