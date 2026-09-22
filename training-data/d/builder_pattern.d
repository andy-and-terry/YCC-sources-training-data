import std.stdio;

class Pizza {
    string size;
    bool cheese;
    bool pepperoni;
    bool mushrooms;

    override string toString() {
        string toppings;
        if (cheese) toppings ~= " cheese";
        if (pepperoni) toppings ~= " pepperoni";
        if (mushrooms) toppings ~= " mushrooms";
        return size ~ " pizza with:" ~ (toppings.length ? toppings : " nothing");
    }
}

class PizzaBuilder {
    private Pizza pizza;

    this() {
        pizza = new Pizza();
        pizza.size = "medium";
    }

    PizzaBuilder withSize(string size) {
        pizza.size = size;
        return this;
    }

    PizzaBuilder withCheese() {
        pizza.cheese = true;
        return this;
    }

    PizzaBuilder withPepperoni() {
        pizza.pepperoni = true;
        return this;
    }

    PizzaBuilder withMushrooms() {
        pizza.mushrooms = true;
        return this;
    }

    Pizza build() {
        return pizza;
    }
}

void main() {
    auto pizza = new PizzaBuilder()
        .withSize("large")
        .withCheese()
        .withPepperoni()
        .build();

    writeln(pizza.toString());
}
