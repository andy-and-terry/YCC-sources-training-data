public class FinalConstantsDemo {
    public static final Integer MAX_RETRIES = 3;
    public static final String PREFIX = 'ACC-';
    public static final List<String> STATUSES = new List<String>{ 'New', 'Open', 'Closed' };

    public static String code(Integer n) {
        return PREFIX + String.valueOf(n).leftPad(4, '0');
    }

    public static void main() {
        System.debug(code(7));
        System.debug(STATUSES.size() + ' statuses, retries ' + MAX_RETRIES);
    }
}
