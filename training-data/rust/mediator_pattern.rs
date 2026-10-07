use std::cell::RefCell;
use std::rc::{Rc, Weak};

trait Mediator {
    fn notify(&self, sender: &str, event: &str);
}

struct ChatRoom {
    log: RefCell<Vec<String>>,
}

impl Mediator for ChatRoom {
    fn notify(&self, sender: &str, event: &str) {
        self.log.borrow_mut().push(format!("[{sender}] {event}"));
    }
}

struct User {
    name: String,
    mediator: Weak<ChatRoom>,
}

impl User {
    fn new(name: &str, mediator: &Rc<ChatRoom>) -> Self {
        User { name: name.to_string(), mediator: Rc::downgrade(mediator) }
    }

    fn send(&self, message: &str) {
        if let Some(room) = self.mediator.upgrade() {
            room.notify(&self.name, message);
        }
    }
}

fn main() {
    let room = Rc::new(ChatRoom { log: RefCell::new(Vec::new()) });
    let alice = User::new("alice", &room);
    let bob = User::new("bob", &room);

    alice.send("hi bob");
    bob.send("hey alice");

    for line in room.log.borrow().iter() {
        println!("{line}");
    }
}
