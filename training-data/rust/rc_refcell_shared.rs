use std::cell::RefCell;
use std::rc::Rc;

fn main() {
    let shared = Rc::new(RefCell::new(vec![1, 2]));
    let a = Rc::clone(&shared);
    a.borrow_mut().push(3);
    println!("{:?} rc={}", shared.borrow(), Rc::strong_count(&shared));
}
