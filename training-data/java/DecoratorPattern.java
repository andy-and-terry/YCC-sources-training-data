public class DecoratorPattern {
    interface Coffee {
        double cost();

        String description();
    }

    static class SimpleCoffee implements Coffee {
        public double cost() {
            return 2.0;
        }

        public String description() {
            return "Coffee";
        }
    }

    abstract static class CoffeeDecorator implements Coffee {
        protected final Coffee wrapped;

        CoffeeDecorator(Coffee wrapped) {
            this.wrapped = wrapped;
        }
    }

    static class MilkDecorator extends CoffeeDecorator {
        MilkDecorator(Coffee wrapped) {
            super(wrapped);
        }

        public double cost() {
            return wrapped.cost() + 0.5;
        }

        public String description() {
            return wrapped.description() + " + Milk";
        }
    }

    static class SugarDecorator extends CoffeeDecorator {
        SugarDecorator(Coffee wrapped) {
            super(wrapped);
        }

        public double cost() {
            return wrapped.cost() + 0.25;
        }

        public String description() {
            return wrapped.description() + " + Sugar";
        }
    }

    public static void main(String[] args) {
        Coffee order = new SugarDecorator(new MilkDecorator(new SimpleCoffee()));
        System.out.println(order.description() + ": $" + order.cost());
    }
}
