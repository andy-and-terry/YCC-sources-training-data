trait Coffee {
    fn cost(&self) -> f64;
    fn description(&self) -> String;
}

struct Espresso;

impl Coffee for Espresso {
    fn cost(&self) -> f64 {
        2.0
    }

    fn description(&self) -> String {
        "Espresso".to_string()
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
        format!("{} + Milk", self.inner.description())
    }
}

struct SyrupDecorator {
    inner: Box<dyn Coffee>,
}

impl Coffee for SyrupDecorator {
    fn cost(&self) -> f64 {
        self.inner.cost() + 0.3
    }

    fn description(&self) -> String {
        format!("{} + Syrup", self.inner.description())
    }
}

fn main() {
    let coffee: Box<dyn Coffee> = Box::new(SyrupDecorator {
        inner: Box::new(MilkDecorator { inner: Box::new(Espresso) }),
    });
    println!("{} costs {:.2}", coffee.description(), coffee.cost());
}
