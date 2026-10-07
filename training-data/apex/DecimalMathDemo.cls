public class DecimalMathDemo {
    public static void run() {
        Decimal price = 19.995;
        System.debug(price.setScale(2, RoundingMode.HALF_UP));    // 20.00
        System.debug(price.setScale(2, RoundingMode.DOWN));       // 19.99
        System.debug(price.setScale(0, RoundingMode.CEILING));    // 20

        Decimal a = 10;
        Decimal b = 3;
        System.debug(a.divide(b, 4));                             // 3.3333
        System.debug(Math.mod(10, 3));
        System.debug(Math.abs(-7.5));
        System.debug(Math.max(4, 9));
        System.debug(Math.pow(2, 10));
        System.debug(Math.sqrt(144));
        System.debug(Math.round(2.5));
        System.debug(Math.floor(-1.2));
    }
}
