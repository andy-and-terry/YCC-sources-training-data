public class Isbn10Validator {
    static boolean isValid(String isbn) {
        String s = isbn.replace("-", "");
        if (!s.matches("\\d{9}[\\dX]")) return false;
        int total = 0;
        for (int i = 0; i < 10; i++) {
            char c = s.charAt(i);
            int v = c == 'X' ? 10 : c - '0';
            total += v * (10 - i);
        }
        return total % 11 == 0;
    }

    public static void main(String[] args) {
        for (String s : new String[] {"3-598-21508-8", "3-598-21507-X", "3-598-21508-9"}) {
            System.out.println(s + " " + isValid(s));
        }
    }
}
