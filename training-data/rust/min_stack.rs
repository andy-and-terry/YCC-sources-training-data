struct MinStack {
    items: Vec<i32>,
    mins: Vec<i32>,
}

impl MinStack {
    fn new() -> Self {
        MinStack { items: vec![], mins: vec![] }
    }

    fn push(&mut self, value: i32) {
        self.items.push(value);
        let current_min = match self.mins.last() {
            Some(&m) => value.min(m),
            None => value,
        };
        self.mins.push(current_min);
    }

    fn pop(&mut self) -> Option<i32> {
        self.mins.pop();
        self.items.pop()
    }

    fn get_min(&self) -> Option<i32> {
        self.mins.last().copied()
    }
}

fn main() {
    let mut s = MinStack::new();
    s.push(3);
    s.push(1);
    s.push(2);
    println!("{:?}", s.get_min());
    s.pop();
    println!("{:?}", s.get_min());
}
