public class BuilderPattern {
    public class Pizza {
        public String size;
        public List<String> toppings;

        public override String toString() {
            return size + ' pizza with ' + String.join(toppings, ', ');
        }
    }

    public class PizzaBuilder {
        private Pizza pizza = new Pizza();

        public PizzaBuilder() {
            pizza.toppings = new List<String>();
        }

        public PizzaBuilder withSize(String size) {
            pizza.size = size;
            return this;
        }

        public PizzaBuilder addTopping(String topping) {
            pizza.toppings.add(topping);
            return this;
        }

        public Pizza build() {
            return pizza;
        }
    }

    public static void main() {
        Pizza pizza = new PizzaBuilder()
            .withSize('Large')
            .addTopping('Pepperoni')
            .addTopping('Mushroom')
            .build();
        System.debug(pizza.toString());
    }
}
