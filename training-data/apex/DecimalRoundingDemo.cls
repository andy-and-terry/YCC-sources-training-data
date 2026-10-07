public class DecimalRoundingDemo {
    public static void main() {
        Decimal value = 2.565;
        System.debug('HALF_UP:   ' + value.setScale(2, RoundingMode.HALF_UP));
        System.debug('HALF_EVEN: ' + value.setScale(2, RoundingMode.HALF_EVEN));
        System.debug('DOWN:      ' + value.setScale(2, RoundingMode.DOWN));
        System.debug('CEILING:   ' + value.setScale(2, RoundingMode.CEILING));
        System.debug('FLOOR:     ' + value.setScale(2, RoundingMode.FLOOR));

        Decimal price = 19.99;
        Decimal total = (price * 3).setScale(2);
        System.debug('total: ' + total);
        System.debug('divide: ' + Decimal.valueOf(10).divide(3, 4));
        System.debug('scale: ' + total.scale());
    }
}
