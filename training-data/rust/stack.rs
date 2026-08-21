struct Stack<T> {
    items: Vec<T>,
}

impl<T> Stack<T> {
    fn new() -> Self {
        Stack { items: Vec::new() }
    }

    fn push(&mut self, item: T) {
        self.items.push(item);
    }

    fn pop(&mut self) -> Option<T> {
        self.items.pop()
    }

    fn peek(&self) -> Option<&T> {
        self.items.last()
    }

    fn is_empty(&self) -> bool {
        self.items.is_empty()
    }
}

fn main() {
    let mut s: Stack<i32> = Stack::new();
    s.push(1);
    s.push(2);
    s.push(3);
    println!("{:?} {:?} {}", s.pop(), s.peek(), s.is_empty());
}
