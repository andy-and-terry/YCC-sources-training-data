public class NullCoalescingDemo {
    public class Config {
        public String name;
        public Map<String, String> options = new Map<String, String>();
    }

    public static void main() {
        String input = null;
        String value = input ?? 'default';
        System.debug(value);

        Config cfg = null;
        String name = cfg?.name ?? 'unnamed';
        System.debug(name);

        Config c2 = new Config();
        c2.options.put('mode', 'fast');
        System.debug(c2.options.get('mode') ?? 'none');
        System.debug(c2.options.get('level') ?? 'none');

        Integer n = 5;
        String size = n > 3 ? 'large' : 'small';
        System.debug(size);
    }
}
