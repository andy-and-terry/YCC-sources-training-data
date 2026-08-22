use std::cell::RefCell;
use std::rc::Rc;

struct GraphNode {
    value: i32,
    neighbors: Vec<Rc<RefCell<GraphNode>>>,
}

impl GraphNode {
    fn new(value: i32) -> Rc<RefCell<Self>> {
        Rc::new(RefCell::new(GraphNode { value, neighbors: vec![] }))
    }
}

fn add_edge(a: &Rc<RefCell<GraphNode>>, b: &Rc<RefCell<GraphNode>>) {
    a.borrow_mut().neighbors.push(Rc::clone(b));
    b.borrow_mut().neighbors.push(Rc::clone(a));
}

fn main() {
    let a = GraphNode::new(1);
    let b = GraphNode::new(2);
    let c = GraphNode::new(3);
    add_edge(&a, &b);
    add_edge(&b, &c);

    let neighbor_values: Vec<i32> = a.borrow().neighbors.iter().map(|n| n.borrow().value).collect();
    println!("{:?}", neighbor_values);
    println!("b has {} neighbors", b.borrow().neighbors.len());
}
