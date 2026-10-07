import java.util.Locale;

public class StringFormatDemo {
    public static void main(String[] args) {
        System.out.println(String.format("|%5d|%-5d|%05d|", 42, 42, 42));
        System.out.println(String.format("|%8.3f|%-8.1f|%e|", Math.PI, Math.E, 12345.678));
        System.out.println(String.format("|%10s|%-10s|%.3s|", "right", "left", "truncate"));
        System.out.println(String.format("%x %X %o %c %b", 255, 255, 8, 'J', true));
        System.out.println(String.format("%,d", 1234567890));
        System.out.println(String.format("%+d %+d", 5, -5));
        System.out.println(String.format("%2$s %1$s %2$s", "a", "b"));
        System.out.println(String.format(Locale.GERMANY, "%,.2f", 9876.5));
        System.out.println("%s has %d items%n".formatted("cart", 3).trim());
        System.out.println("%08.2f".formatted(-3.14159));
        System.out.println(String.format("%%"));
    }
}
