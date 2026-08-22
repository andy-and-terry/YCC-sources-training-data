struct Subject {
    observers: Vec<Box<dyn Fn(f64)>>,
}

impl Subject {
    fn new() -> Self {
        Subject { observers: vec![] }
    }

    fn subscribe(&mut self, observer: Box<dyn Fn(f64)>) {
        self.observers.push(observer);
    }

    fn notify(&self, value: f64) {
        for observer in &self.observers {
            observer(value);
        }
    }
}

fn main() {
    let mut sensor = Subject::new();
    sensor.subscribe(Box::new(|t| println!("Alert: temperature is now {}", t)));
    sensor.notify(25.5);
}
