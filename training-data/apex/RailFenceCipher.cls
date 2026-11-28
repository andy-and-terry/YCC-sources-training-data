public class RailFenceCipher {
    public static String encrypt(String text, Integer k) {
        Integer cycle = 2 * (k - 1);
        List<String> rails = new List<String>();
        for (Integer r = 0; r < k; r++) {
            rails.add('');
        }
        for (Integer i = 0; i < text.length(); i++) {
            Integer r = Math.mod(i, cycle);
            Integer rail = r < k ? r : cycle - r;
            rails[rail] += text.substring(i, i + 1);
        }
        return String.join(rails, '');
    }

    public static void demo() {
        System.debug(encrypt('WEAREDISCOVERED', 3));
    }
}
