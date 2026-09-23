public class RegexPatternDemo {
    private static final Pattern EMAIL_PATTERN = Pattern.compile('^[\\w.+-]+@[\\w-]+\\.[a-zA-Z]{2,}$');

    public static Boolean isValidEmail(String candidate) {
        if (String.isBlank(candidate)) {
            return false;
        }
        Matcher m = EMAIL_PATTERN.matcher(candidate);
        return m.matches();
    }

    public static List<String> extractDigits(String text) {
        Matcher m = Pattern.compile('\\d+').matcher(text);
        List<String> matches = new List<String>();
        while (m.find()) {
            matches.add(m.group());
        }
        return matches;
    }

    public static void main() {
        System.debug(isValidEmail('user@example.com'));
        System.debug(isValidEmail('not-an-email'));
        System.debug(extractDigits('Order 42 shipped in box 7'));
    }
}
