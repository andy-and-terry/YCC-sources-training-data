public class MathFunctionsDemo {
    public static void main() {
        System.debug(Math.abs(-7.5));
        System.debug(Math.ceil(2.1));
        System.debug(Math.floor(-2.1));
        System.debug(Math.round(2.5));
        System.debug(Math.roundToLong(-2.5));
        System.debug(Math.max(3, 9));
        System.debug(Math.min(3.5, 1.25));
        System.debug(Math.pow(2, 10));
        System.debug(Math.sqrt(144));
        System.debug(Math.mod(-7, 3));
        System.debug(Math.signum(-4));
        Decimal price = 12.3456;
        System.debug(price.setScale(2, RoundingMode.HALF_UP));
    }
}
