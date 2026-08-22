#[derive(Debug, Default)]
struct Pizza {
    toppings: Vec<String>,
    size: String,
}

struct PizzaBuilder {
    pizza: Pizza,
}

impl PizzaBuilder {
    fn new() -> Self {
        PizzaBuilder { pizza: Pizza { size: "medium".to_string(), ..Default::default() } }
    }

    fn size(mut self, size: &str) -> Self {
        self.pizza.size = size.to_string();
        self
    }

    fn add_topping(mut self, topping: &str) -> Self {
        self.pizza.toppings.push(topping.to_string());
        self
    }

    fn build(self) -> Pizza {
        self.pizza
    }
}

fn main() {
    let pizza = PizzaBuilder::new().size("large").add_topping("cheese").add_topping("olives").build();
    println!("{:?}", pizza);
}
