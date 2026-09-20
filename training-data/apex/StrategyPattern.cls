public class StrategyPattern {
    public interface DiscountStrategy {
        Decimal apply(Decimal price);
    }

    public class NoDiscount implements DiscountStrategy {
        public Decimal apply(Decimal price) {
            return price;
        }
    }

    public class PercentageDiscount implements DiscountStrategy {
        private Decimal percent;
        public PercentageDiscount(Decimal percent) {
            this.percent = percent;
        }
        public Decimal apply(Decimal price) {
            return price * (1 - percent / 100);
        }
    }

    public class FlatDiscount implements DiscountStrategy {
        private Decimal amount;
        public FlatDiscount(Decimal amount) {
            this.amount = amount;
        }
        public Decimal apply(Decimal price) {
            return price - amount;
        }
    }

    public class Checkout {
        private DiscountStrategy strategy;
        public Checkout(DiscountStrategy strategy) {
            this.strategy = strategy;
        }
        public Decimal total(Decimal price) {
            return strategy.apply(price);
        }
    }

    public static void main() {
        Checkout regular = new Checkout(new NoDiscount());
        Checkout tenPercentOff = new Checkout(new PercentageDiscount(10));
        Checkout fiveOff = new Checkout(new FlatDiscount(5));

        System.debug(regular.total(100));
        System.debug(tenPercentOff.total(100));
        System.debug(fiveOff.total(100));
    }
}
