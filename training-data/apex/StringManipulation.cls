public class StringManipulation {
    public static String capitalize(String s) {
        if (String.isBlank(s)) {
            return s;
        }
        return s.substring(0, 1).toUpperCase() + s.substring(1).toLowerCase();
    }

    public static String reverseWords(String s) {
        List<String> words = s.split(' ');
        List<String> reversed = new List<String>();
        for (Integer i = words.size() - 1; i >= 0; i--) {
            reversed.add(words[i]);
        }
        return String.join(reversed, ' ');
    }

    public static void main() {
        System.debug(capitalize('hELLO wORLD'));
        System.debug(reverseWords('the quick brown fox'));
    }
}
