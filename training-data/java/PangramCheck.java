public class PangramCheck {
    static boolean isPangram(String s) {
        return s.toLowerCase().chars().filter(c -> c >= 'a' && c <= 'z').distinct().count() == 26;
    }

    public static void main(String[] args) {
        System.out.println(isPangram("The quick brown fox jumps over the lazy dog"));
        System.out.println(isPangram("Hello world"));
    }
}
