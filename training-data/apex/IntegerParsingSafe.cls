public class IntegerParsingSafe {
    public static Integer parseOrDefault(String text, Integer fallback) {
        try {
            return Integer.valueOf(text);
        } catch (TypeException e) {
            return fallback;
        }
    }

    public static void main() {
        System.debug(parseOrDefault('42', -1));
        System.debug(parseOrDefault('4x2', -1));
        System.debug(parseOrDefault(null, 0));
    }
}
