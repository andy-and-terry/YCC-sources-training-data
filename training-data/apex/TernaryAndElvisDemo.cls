public class TernaryAndElvisDemo {
    public static String label(Integer score) {
        return score >= 90 ? 'A' : score >= 80 ? 'B' : 'C';
    }

    public static String orDefault(String value) {
        return value != null ? value : 'n/a';
    }

    public static void main() {
        System.debug(label(95));
        System.debug(label(82));
        System.debug(orDefault(null));
    }
}
