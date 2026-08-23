class Pizza {
    String size
    List<String> toppings = []

    static class Builder {
        Pizza pizza = new Pizza()

        Builder size(String s) {
            pizza.size = s
            return this
        }

        Builder topping(String t) {
            pizza.toppings << t
            return this
        }

        Pizza build() {
            return pizza
        }
    }
}

def pizza = new Pizza.Builder().size("Large").topping("Cheese").topping("Pepperoni").build()
println "${pizza.size}: ${pizza.toppings}"
