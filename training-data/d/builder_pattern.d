import std.stdio;
import std.array : join;

class Pizza {
    private string size;
    private string[] toppings;

    this(string size, string[] toppings) {
        this.size = size;
        this.toppings = toppings;
    }

    override string toString() {
        return size ~ " pizza with " ~ toppings.join(", ");
    }
}

class PizzaBuilder {
    private string size_ = "medium";
    private string[] toppings_;

    PizzaBuilder size(string size) {
        size_ = size;
        return this;
    }

    PizzaBuilder addTopping(string topping) {
        toppings_ ~= topping;
        return this;
    }

    Pizza build() {
        return new Pizza(size_, toppings_);
    }
}

void main() {
    auto pizza = new PizzaBuilder()
        .size("large")
        .addTopping("cheese")
        .addTopping("mushroom")
        .build();

    writeln(pizza);
}
