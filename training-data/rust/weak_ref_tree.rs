// Rc<RefCell<>> for parent-owned children plus Weak parent back-pointers,
// so the tree has no reference cycles (children own strong refs down,
// parents hold only weak refs up).
use std::cell::RefCell;
use std::rc::{Rc, Weak};

struct TreeNode {
    value: i32,
    parent: RefCell<Weak<TreeNode>>,
    children: RefCell<Vec<Rc<TreeNode>>>,
}

impl TreeNode {
    fn new(value: i32) -> Rc<TreeNode> {
        Rc::new(TreeNode {
            value,
            parent: RefCell::new(Weak::new()),
            children: RefCell::new(Vec::new()),
        })
    }

    fn add_child(parent: &Rc<TreeNode>, child: Rc<TreeNode>) {
        *child.parent.borrow_mut() = Rc::downgrade(parent);
        parent.children.borrow_mut().push(child);
    }

    fn parent_value(&self) -> Option<i32> {
        self.parent.borrow().upgrade().map(|p| p.value)
    }
}

fn main() {
    let root = TreeNode::new(1);
    let child_a = TreeNode::new(2);
    let child_b = TreeNode::new(3);
    let grandchild = TreeNode::new(4);

    TreeNode::add_child(&root, Rc::clone(&child_a));
    TreeNode::add_child(&root, Rc::clone(&child_b));
    TreeNode::add_child(&child_a, Rc::clone(&grandchild));

    println!("root strong count: {}", Rc::strong_count(&root));
    println!("child_a's parent value: {:?}", child_a.parent_value());
    println!("root's parent value: {:?}", root.parent_value());
    println!("grandchild's parent value: {:?}", grandchild.parent_value());

    let child_values: Vec<i32> = root.children.borrow().iter().map(|c| c.value).collect();
    println!("root's children: {:?}", child_values);
}
