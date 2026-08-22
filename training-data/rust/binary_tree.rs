struct Node {
    value: i32,
    left: Option<Box<Node>>,
    right: Option<Box<Node>>,
}

impl Node {
    fn new(value: i32) -> Self {
        Node { value, left: None, right: None }
    }

    fn insert(&mut self, value: i32) {
        if value < self.value {
            match &mut self.left {
                Some(node) => node.insert(value),
                None => self.left = Some(Box::new(Node::new(value))),
            }
        } else {
            match &mut self.right {
                Some(node) => node.insert(value),
                None => self.right = Some(Box::new(Node::new(value))),
            }
        }
    }

    fn in_order(&self, result: &mut Vec<i32>) {
        if let Some(node) = &self.left {
            node.in_order(result);
        }
        result.push(self.value);
        if let Some(node) = &self.right {
            node.in_order(result);
        }
    }
}

fn main() {
    let mut root = Node::new(5);
    for v in [3, 8, 1, 4, 7, 9] {
        root.insert(v);
    }
    let mut result = Vec::new();
    root.in_order(&mut result);
    println!("{:?}", result);
}
