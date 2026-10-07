#[derive(Debug)]
struct Node {
    value: i32,
    left: Option<Box<Node>>,
    right: Option<Box<Node>>,
}

impl Node {
    fn new(value: i32) -> Self {
        Node { value, left: None, right: None }
    }

    fn insert(&mut self, v: i32) {
        let slot = if v < self.value { &mut self.left } else { &mut self.right };
        match slot {
            Some(n) => n.insert(v),
            None => *slot = Some(Box::new(Node::new(v))),
        }
    }

    fn inorder(&self, out: &mut Vec<i32>) {
        if let Some(l) = &self.left { l.inorder(out); }
        out.push(self.value);
        if let Some(r) = &self.right { r.inorder(out); }
    }

    fn height(&self) -> usize {
        1 + self.left.as_ref().map_or(0, |n| n.height())
            .max(self.right.as_ref().map_or(0, |n| n.height()))
    }
}

fn main() {
    let mut root = Node::new(8);
    for v in [3, 10, 1, 6, 14, 4] {
        root.insert(v);
    }
    let mut out = Vec::new();
    root.inorder(&mut out);
    println!("{:?} height={}", out, root.height());
}
