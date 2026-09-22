public class StrategyPattern {
    public interface PricingStrategy {
        Double price(Double baseAmount);
    }

    public class RegularPricing implements PricingStrategy {
        public Double price(Double baseAmount) {
            return baseAmount;
        }
    }

    public class MemberDiscountPricing implements PricingStrategy {
        public Double price(Double baseAmount) {
            return baseAmount * 0.9;
        }
    }

    public class ClearancePricing implements PricingStrategy {
        public Double price(Double baseAmount) {
            return baseAmount * 0.5;
        }
    }

    public class Checkout {
        private PricingStrategy strategy;

        public Checkout(PricingStrategy strategy) {
            this.strategy = strategy;
        }

        public void setStrategy(PricingStrategy strategy) {
            this.strategy = strategy;
        }

        public Double total(Double baseAmount) {
            return strategy.price(baseAmount);
        }
    }

    public static void main() {
        StrategyPattern outer = new StrategyPattern();
        Checkout checkout = outer.new Checkout(outer.new RegularPricing());
        System.debug(checkout.total(100.0));

        checkout.setStrategy(outer.new MemberDiscountPricing());
        System.debug(checkout.total(100.0));

        checkout.setStrategy(outer.new ClearancePricing());
        System.debug(checkout.total(100.0));
    }
}
