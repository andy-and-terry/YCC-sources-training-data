public class Rot47Cipher {
    public static String rot47(String s) {
        String out = '';
        for (Integer c : s.getChars()) {
            if (c >= 33 && c <= 126) {
                c = 33 + Math.mod(c - 33 + 47, 94);
            }
            out += String.fromCharArray(new List<Integer>{ c });
        }
        return out;
    }
}
