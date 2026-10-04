public class DecimalRoundingDemo {
    public static Decimal roundMoney(Decimal amount) {
        return amount.setScale(2, RoundingMode.HALF_EVEN);
    }

    public static void main() {
        Decimal value = 2.345;
        System.debug(value.setScale(2, RoundingMode.HALF_UP));    // 2.35
        System.debug(value.setScale(2, RoundingMode.HALF_DOWN));  // 2.34
        System.debug(value.setScale(2, RoundingMode.DOWN));       // 2.34
        System.debug(value.setScale(0, RoundingMode.CEILING));    // 3
        System.debug(value.setScale(0, RoundingMode.FLOOR));      // 2

        System.debug(roundMoney(2.125));  // 2.12 (banker's rounding)
        System.debug(roundMoney(2.135));  // 2.14

        Decimal a = 10;
        Decimal b = 3;
        System.debug(a.divide(b, 4));           // 3.3333
        System.debug(a.divide(b, 2, RoundingMode.UP));
        System.debug(Decimal.valueOf(1.5).intValue());
        System.debug(value.scale());
        System.debug((0.1 + 0.2) == 0.3);       // false for Double math
        System.debug(Decimal.valueOf('0.1') + Decimal.valueOf('0.2') == Decimal.valueOf('0.3'));
    }
}
