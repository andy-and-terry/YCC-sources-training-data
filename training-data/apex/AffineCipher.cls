public class AffineCipher {
    public static String encrypt(String text, Integer a, Integer b) {
        String out = '';
        for (Integer cp : text.toUpperCase().getChars()) {
            if (cp >= 65 && cp <= 90) {
                cp = Math.mod(a * (cp - 65) + b, 26) + 65;
            }
            out += String.fromCharArray(new List<Integer>{cp});
        }
        return out;
    }

    public static void demo() {
        System.debug(encrypt('AFFINE', 5, 8));
    }
}
