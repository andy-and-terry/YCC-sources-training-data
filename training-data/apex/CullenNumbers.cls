public class CullenNumbers {
    public static Long cullen(Integer n) {
        return (Long) n * (Long) Math.pow(2, n) + 1;
    }

    public static void main() {
        for (Integer n = 1; n <= 5; n++) {
            System.debug(n + ' ' + cullen(n));
        }
    }
}
