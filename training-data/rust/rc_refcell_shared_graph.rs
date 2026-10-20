use std::cell::RefCell;
use std::rc::{Rc, Weak};

struct Node { val: i32, children: RefCell<Vec<Rc<Node>>>, parent: RefCell<Weak<Node>> }

fn main() {
    let leaf = Rc::new(Node { val: 3, children: RefCell::new(vec![]), parent: RefCell::new(Weak::new()) });
    let branch = Rc::new(Node { val: 5, children: RefCell::new(vec![Rc::clone(&leaf)]), parent: RefCell::new(Weak::new()) });
    *leaf.parent.borrow_mut() = Rc::downgrade(&branch);
    println!("{:?}", leaf.parent.borrow().upgrade().map(|p| p.val));
    println!("{} {}", Rc::strong_count(&leaf), Rc::weak_count(&branch));
    println!("{}", branch.children.borrow().len());
}
