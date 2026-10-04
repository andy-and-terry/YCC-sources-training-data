public class NullCoalescingDemo {
    public static String greet(String name) {
        return 'Hello, ' + (name ?? 'stranger');
    }

    public static Integer parseOrDefault(String s, Integer fallback) {
        return s != null && s.isNumeric() ? Integer.valueOf(s) : fallback;
    }

    public static void main() {
        System.debug(greet(null));
        System.debug(greet('Ada'));
        System.debug(parseOrDefault('42', 0));
        System.debug(parseOrDefault('x1', -1));
        String maybe = null;
        System.debug(maybe?.toUpperCase() ?? 'none');
    }
}
