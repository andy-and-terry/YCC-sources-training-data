public class StringFormatDemo {
    public static void main(String[] args) {
        System.out.println(String.format("|%5d|%-5d|%05d|", 42, 42, 42));
        System.out.println(String.format("|%8.3f|%-8.1f|%e|", Math.PI, Math.E, 12345.678));
        System.out.println(String.format("|%10s|%-10s|%.3s|", "right", "left", "truncate"));
        System.out.println(String.format("%x %X %o %b %c", 255, 255, 8, true, 'Z'));
        System.out.println(String.format("%,d items cost $%,.2f", 1234567, 9876.5));
        System.out.println(String.format("%2$s %1$s %2$s", "world", "hello"));
        System.out.println("%s has %d chars".formatted("banana", "banana".length()));
        System.out.printf("%08.2f%n", -3.14159);
        System.out.printf("%+d %+d%n", 5, -5);
    }
}
