public class LongIntegerOverflowDemo {
    public static void main() {
        Integer maxInt = 2147483647;
        Long big = (Long) maxInt + 1;
        System.debug(big);
        Long product = 100000L * 100000L;
        System.debug(product);
        Integer wrapped = maxInt + 1;
        System.debug(wrapped);
    }
}
