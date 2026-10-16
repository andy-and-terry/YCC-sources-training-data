struct Node {
    val: i32,
    next: Option<Box<Node>>,
}

struct Stack {
    head: Option<Box<Node>>,
    len: usize,
}

impl Stack {
    fn new() -> Self { Stack { head: None, len: 0 } }

    fn push(&mut self, val: i32) {
        let old = self.head.take();
        self.head = Some(Box::new(Node { val, next: old }));
        self.len += 1;
    }

    fn pop(&mut self) -> Option<i32> {
        self.head.take().map(|n| {
            self.head = n.next;
            self.len -= 1;
            n.val
        })
    }

    fn peek(&self) -> Option<&i32> {
        self.head.as_ref().map(|n| &n.val)
    }
}

fn main() {
    let mut s = Stack::new();
    for i in 1..=4 {
        s.push(i * i);
    }
    println!("peek {:?} len {}", s.peek(), s.len);
    while let Some(v) = s.pop() {
        print!("{} ", v);
    }
    println!("\nempty peek {:?}", s.peek());
}
