public class CoffeeDecorator {
    public interface Coffee {
        Double cost();
        String description();
    }

    public class SimpleCoffee implements Coffee {
        public Double cost() {
            return 2.0;
        }
        public String description() {
            return "Coffee";
        }
    }

    public abstract class AddonDecorator implements Coffee {
        protected Coffee wrapped;
        public AddonDecorator(Coffee wrapped) {
            this.wrapped = wrapped;
        }
    }

    public class MilkDecorator extends AddonDecorator {
        public MilkDecorator(Coffee wrapped) {
            super(wrapped);
        }
        public Double cost() {
            return wrapped.cost() + 0.5;
        }
        public String description() {
            return wrapped.description() + ' + Milk';
        }
    }

    public class SugarDecorator extends AddonDecorator {
        public SugarDecorator(Coffee wrapped) {
            super(wrapped);
        }
        public Double cost() {
            return wrapped.cost() + 0.25;
        }
        public String description() {
            return wrapped.description() + ' + Sugar';
        }
    }

    public static void main() {
        Coffee order = new SimpleCoffee();
        order = new MilkDecorator(order);
        order = new SugarDecorator(order);
        System.debug(order.description());
        System.debug(order.cost());
    }
}
