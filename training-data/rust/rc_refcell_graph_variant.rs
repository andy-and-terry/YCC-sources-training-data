use std::cell::RefCell;
use std::rc::Rc;

struct Node {
    val: i32,
    next: Option<Rc<RefCell<Node>>>,
}

fn main() {
    let b = Rc::new(RefCell::new(Node { val: 2, next: None }));
    let a = Node { val: 1, next: Some(Rc::clone(&b)) };
    b.borrow_mut().val += 10;
    println!("{} -> {}", a.val, a.next.unwrap().borrow().val);
    println!("rc count: {}", Rc::strong_count(&b));
}
