use std::collections::HashMap;

struct PubSub {
    subscribers: HashMap<String, Vec<Box<dyn Fn(&str)>>>,
}

impl PubSub {
    fn new() -> Self {
        PubSub { subscribers: HashMap::new() }
    }

    fn subscribe(&mut self, topic: &str, handler: Box<dyn Fn(&str)>) {
        self.subscribers.entry(topic.to_string()).or_insert_with(Vec::new).push(handler);
    }

    fn publish(&self, topic: &str, message: &str) {
        if let Some(handlers) = self.subscribers.get(topic) {
            for handler in handlers {
                handler(message);
            }
        }
    }
}

fn main() {
    let mut bus = PubSub::new();
    bus.subscribe("news", Box::new(|msg| println!("received: {}", msg)));
    bus.publish("news", "hello subscribers");
}
