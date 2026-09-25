public class AtbashCipher {
    public static String apply(String text) {
        StringBuilder sb = new StringBuilder(text.length());
        for (char c : text.toCharArray()) {
            if (c >= 'a' && c <= 'z') sb.append((char) ('z' - (c - 'a')));
            else if (c >= 'A' && c <= 'Z') sb.append((char) ('Z' - (c - 'A')));
            else sb.append(c);
        }
        return sb.toString();
    }

    public static void main(String[] args) {
        String enc = apply("Hello, World!");
        System.out.println(enc + " | " + apply(enc));
    }
}
