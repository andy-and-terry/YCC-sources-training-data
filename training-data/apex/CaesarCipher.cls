public class CaesarCipher {
    public static String shift(String text, Integer key) {
        Integer k = Math.mod(Math.mod(key, 26) + 26, 26);
        List<Integer> out = new List<Integer>();
        for (Integer code : text.getChars()) {
            if (code >= 65 && code <= 90) {
                out.add(Math.mod(code - 65 + k, 26) + 65);
            } else if (code >= 97 && code <= 122) {
                out.add(Math.mod(code - 97 + k, 26) + 97);
            } else {
                out.add(code);
            }
        }
        return String.fromCharArray(out);
    }

    public static void main() {
        String encrypted = shift('Hello, World!', 3);
        System.debug(encrypted);
        System.debug(shift(encrypted, -3));
    }
}
