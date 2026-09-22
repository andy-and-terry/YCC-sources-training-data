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
            return price - (price * percent / 100);
        }
    }

    public class FlatDiscount implements DiscountStrategy {
        private Decimal amount;
        public FlatDiscount(Decimal amount) {
            this.amount = amount;
        }
        public Decimal apply(Decimal price) {
            Decimal discounted = price - amount;
            return discounted > 0 ? discounted : 0;
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
        Checkout noDiscountCheckout = new Checkout(new NoDiscount());
        Checkout percentCheckout = new Checkout(new PercentageDiscount(10));
        Checkout flatCheckout = new Checkout(new FlatDiscount(15));

        System.debug(noDiscountCheckout.total(200));
        System.debug(percentCheckout.total(200));
        System.debug(flatCheckout.total(200));
    }
}
