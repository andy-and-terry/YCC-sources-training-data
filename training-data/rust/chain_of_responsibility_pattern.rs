enum Level {
    Info,
    Warning,
    Error,
}

trait Handler {
    fn set_next(self: Box<Self>, next: Box<dyn Handler>) -> Box<dyn Handler>;
    fn handle(&self, level: &Level, message: &str);
}

struct ConsoleHandler {
    next: Option<Box<dyn Handler>>,
}

impl Handler for ConsoleHandler {
    fn set_next(mut self: Box<Self>, next: Box<dyn Handler>) -> Box<dyn Handler> {
        self.next = Some(next);
        self
    }

    fn handle(&self, level: &Level, message: &str) {
        if matches!(level, Level::Info) {
            println!("[console] {message}");
        } else if let Some(next) = &self.next {
            next.handle(level, message);
        }
    }
}

struct FileHandler {
    next: Option<Box<dyn Handler>>,
}

impl Handler for FileHandler {
    fn set_next(mut self: Box<Self>, next: Box<dyn Handler>) -> Box<dyn Handler> {
        self.next = Some(next);
        self
    }

    fn handle(&self, level: &Level, message: &str) {
        if matches!(level, Level::Warning) {
            println!("[file] {message}");
        } else if let Some(next) = &self.next {
            next.handle(level, message);
        }
    }
}

struct AlertHandler;

impl Handler for AlertHandler {
    fn set_next(self: Box<Self>, _next: Box<dyn Handler>) -> Box<dyn Handler> {
        self
    }

    fn handle(&self, level: &Level, message: &str) {
        if matches!(level, Level::Error) {
            println!("[alert] {message}");
        } else {
            println!("[alert] dropped unhandled message: {message}");
        }
    }
}

fn main() {
    let chain: Box<dyn Handler> = Box::new(ConsoleHandler { next: None })
        .set_next(Box::new(FileHandler { next: None }).set_next(Box::new(AlertHandler)));

    chain.handle(&Level::Info, "server started");
    chain.handle(&Level::Warning, "disk usage at 85%");
    chain.handle(&Level::Error, "connection lost");
}
