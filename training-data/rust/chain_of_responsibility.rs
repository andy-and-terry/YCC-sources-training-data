trait Handler {
    fn handle(&self, request: u32) -> Option<String>;
}

struct LowHandler;

impl Handler for LowHandler {
    fn handle(&self, request: u32) -> Option<String> {
        if request < 10 {
            Some(format!("LowHandler handled {}", request))
        } else {
            None
        }
    }
}

struct MidHandler;

impl Handler for MidHandler {
    fn handle(&self, request: u32) -> Option<String> {
        if request < 100 {
            Some(format!("MidHandler handled {}", request))
        } else {
            None
        }
    }
}

struct HighHandler;

impl Handler for HighHandler {
    fn handle(&self, request: u32) -> Option<String> {
        Some(format!("HighHandler handled {}", request))
    }
}

struct Chain {
    handlers: Vec<Box<dyn Handler>>,
}

impl Chain {
    fn new(handlers: Vec<Box<dyn Handler>>) -> Self {
        Chain { handlers }
    }

    // Passes the request down the chain until a handler accepts it.
    fn dispatch(&self, request: u32) -> String {
        for handler in &self.handlers {
            if let Some(result) = handler.handle(request) {
                return result;
            }
        }
        "Unhandled".to_string()
    }
}

fn main() {
    let chain = Chain::new(vec![Box::new(LowHandler), Box::new(MidHandler), Box::new(HighHandler)]);
    for request in [5, 42, 999] {
        println!("{}", chain.dispatch(request));
    }
}
