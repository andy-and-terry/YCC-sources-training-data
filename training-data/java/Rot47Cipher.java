public class Rot47Cipher {
    static String rot47(String s) {
        StringBuilder sb = new StringBuilder();
        for (char c : s.toCharArray()) {
            sb.append(c >= 33 && c <= 126 ? (char) (33 + (c - 33 + 47) % 94) : c);
        }
        return sb.toString();
    }

    public static void main(String[] args) {
        String e = rot47("Hello, World!");
        System.out.println(e + " " + rot47(e));
    }
}
