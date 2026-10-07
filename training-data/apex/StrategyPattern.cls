public class StrategyPattern {
    public interface DiscountStrategy {
        Decimal apply(Decimal amount);
    }

    public class NoDiscount implements DiscountStrategy {
        public Decimal apply(Decimal amount) {
            return amount;
        }
    }

    public class PercentageDiscount implements DiscountStrategy {
        private Decimal percent;

        public PercentageDiscount(Decimal percent) {
            this.percent = percent;
        }

        public Decimal apply(Decimal amount) {
            return amount - (amount * percent / 100);
        }
    }

    public class FlatDiscount implements DiscountStrategy {
        private Decimal flatAmount;

        public FlatDiscount(Decimal flatAmount) {
            this.flatAmount = flatAmount;
        }

        public Decimal apply(Decimal amount) {
            return Math.max(0, amount - flatAmount);
        }
    }

    public class PriceCalculator {
        private DiscountStrategy strategy;

        public PriceCalculator(DiscountStrategy strategy) {
            this.strategy = strategy;
        }

        public Decimal calculate(Decimal amount) {
            return strategy.apply(amount);
        }
    }

    public static void main() {
        PriceCalculator calc = new PriceCalculator(new PercentageDiscount(10));
        System.debug(calc.calculate(200));

        calc = new PriceCalculator(new FlatDiscount(15));
        System.debug(calc.calculate(200));

        calc = new PriceCalculator(new NoDiscount());
        System.debug(calc.calculate(200));
    }
}
