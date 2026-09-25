public class AtbashCipher {
    static String transform(String s) {
        StringBuilder sb = new StringBuilder();
        for (char c : s.toLowerCase().toCharArray()) {
            if (c >= 'a' && c <= 'z') sb.append((char) ('z' - (c - 'a')));
            else if (Character.isDigit(c)) sb.append(c);
        }
        return sb.toString();
    }

    static String encode(String s) {
        String t = transform(s);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < t.length(); i++) {
            if (i > 0 && i % 5 == 0) sb.append(' ');
            sb.append(t.charAt(i));
        }
        return sb.toString();
    }

    public static void main(String[] args) {
        String e = encode("The quick brown fox");
        System.out.println(e + " -> " + transform(e));
    }
}
