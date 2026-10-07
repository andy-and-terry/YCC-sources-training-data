class Burger : Object {
    public string bun;
    public string patty;
    public string[] toppings;

    public string describe() {
        return "%s bun, %s patty, toppings: %s".printf(bun, patty, string.joinv(", ", toppings));
    }
}

class BurgerBuilder : Object {
    string bun = "plain";
    string patty = "none";
    string[] toppings = {};

    public BurgerBuilder with_bun(string bun) {
        this.bun = bun;
        return this;
    }

    public BurgerBuilder with_patty(string patty) {
        this.patty = patty;
        return this;
    }

    public BurgerBuilder add_topping(string topping) {
        toppings += topping;
        return this;
    }

    public Burger build() {
        var burger = new Burger();
        burger.bun = bun;
        burger.patty = patty;
        burger.toppings = toppings;
        return burger;
    }
}

void main() {
    var burger = new BurgerBuilder()
        .with_bun("sesame")
        .with_patty("veggie")
        .add_topping("lettuce")
        .add_topping("tomato")
        .build();

    stdout.printf("%s\n", burger.describe());
}
