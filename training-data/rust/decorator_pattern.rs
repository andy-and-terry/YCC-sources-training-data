// Each decorator wraps a boxed trait object and adds behavior around
// the wrapped call, letting decorations stack without touching the
// base implementation or each other.
trait Coffee {
    fn cost(&self) -> f64;
    fn description(&self) -> String;
}

struct SimpleCoffee;

impl Coffee for SimpleCoffee {
    fn cost(&self) -> f64 {
        2.0
    }

    fn description(&self) -> String {
        "coffee".to_string()
    }
}

struct MilkDecorator {
    inner: Box<dyn Coffee>,
}

impl Coffee for MilkDecorator {
    fn cost(&self) -> f64 {
        self.inner.cost() + 0.5
    }

    fn description(&self) -> String {
        format!("{} with milk", self.inner.description())
    }
}

struct SugarDecorator {
    inner: Box<dyn Coffee>,
}

impl Coffee for SugarDecorator {
    fn cost(&self) -> f64 {
        self.inner.cost() + 0.25
    }

    fn description(&self) -> String {
        format!("{} with sugar", self.inner.description())
    }
}

fn main() {
    let coffee: Box<dyn Coffee> = Box::new(SugarDecorator {
        inner: Box::new(MilkDecorator {
            inner: Box::new(SimpleCoffee),
        }),
    });

    println!("{}: ${:.2}", coffee.description(), coffee.cost());
}
