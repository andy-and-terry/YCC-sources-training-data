public class DecimalScaleCurrency {
    public static Decimal applyTax(Decimal amount, Decimal ratePercent) {
        Decimal tax = amount * ratePercent / 100;
        return (amount + tax).setScale(2, RoundingMode.HALF_UP);
    }

    public static void main() {
        System.debug(applyTax(19.99, 8.25));
        System.debug(applyTax(100, 7.5));
        Decimal d = 10.0;
        System.debug(d.scale());
    }
}
