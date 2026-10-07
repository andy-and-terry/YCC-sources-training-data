use std::cell::RefCell;
use std::rc::{Rc, Weak};

// A tree where children hold strong references down (Rc) but a
// parent pointer going back up is Weak -- otherwise parent and
// child would each keep the other alive forever, leaking the tree.
struct Node {
    value: i32,
    parent: RefCell<Weak<Node>>,
    children: RefCell<Vec<Rc<Node>>>,
}

impl Node {
    fn new(value: i32) -> Rc<Self> {
        Rc::new(Node {
            value,
            parent: RefCell::new(Weak::new()),
            children: RefCell::new(vec![]),
        })
    }
}

fn add_child(parent: &Rc<Node>, child: &Rc<Node>) {
    *child.parent.borrow_mut() = Rc::downgrade(parent);
    parent.children.borrow_mut().push(Rc::clone(child));
}

fn main() {
    let root = Node::new(1);
    let child = Node::new(2);
    let grandchild = Node::new(3);

    add_child(&root, &child);
    add_child(&child, &grandchild);

    println!("root strong count: {}", Rc::strong_count(&root));
    println!("child strong count: {}", Rc::strong_count(&child));

    // Walk back up through weak parent pointers, upgrading each one.
    let mut current = Rc::clone(&grandchild);
    let mut path = vec![current.value];
    loop {
        let next = current.parent.borrow().upgrade();
        match next {
            Some(parent) => {
                path.push(parent.value);
                current = parent;
            }
            None => break,
        }
    }
    println!("path to root: {:?}", path);

    println!("root has no parent: {}", root.parent.borrow().upgrade().is_none());
}
