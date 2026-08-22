#[derive(Debug)]
struct Node {
    value: i32,
    next: Option<Box<Node>>,
}

fn reverse(mut head: Option<Box<Node>>) -> Option<Box<Node>> {
    let mut prev = None;
    while let Some(mut node) = head {
        head = node.next.take();
        node.next = prev;
        prev = Some(node);
    }
    prev
}

fn to_vec(mut head: &Option<Box<Node>>) -> Vec<i32> {
    let mut result = vec![];
    while let Some(node) = head {
        result.push(node.value);
        head = &node.next;
    }
    result
}

fn main() {
    let head = Some(Box::new(Node {
        value: 1,
        next: Some(Box::new(Node {
            value: 2,
            next: Some(Box::new(Node { value: 3, next: None })),
        })),
    }));
    println!("{:?}", to_vec(&reverse(head)));
}
