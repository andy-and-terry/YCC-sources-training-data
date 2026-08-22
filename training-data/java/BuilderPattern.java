import java.util.ArrayList;
import java.util.List;

public class BuilderPattern {
    static class Pizza {
        List<String> toppings = new ArrayList<>();
        String size = "medium";

        @Override
        public String toString() {
            return "Pizza(size=" + size + ", toppings=" + toppings + ")";
        }
    }

    static class PizzaBuilder {
        private final Pizza pizza = new Pizza();

        PizzaBuilder size(String size) {
            pizza.size = size;
            return this;
        }

        PizzaBuilder addTopping(String topping) {
            pizza.toppings.add(topping);
            return this;
        }

        Pizza build() {
            return pizza;
        }
    }

    public static void main(String[] args) {
        Pizza pizza = new PizzaBuilder().size("large").addTopping("cheese").addTopping("olives").build();
        System.out.println(pizza);
    }
}
