struct QueueViaStacks {
    input: Vec<i32>,
    output: Vec<i32>,
}

impl QueueViaStacks {
    fn new() -> Self {
        QueueViaStacks { input: vec![], output: vec![] }
    }

    fn enqueue(&mut self, item: i32) {
        self.input.push(item);
    }

    fn dequeue(&mut self) -> Option<i32> {
        if self.output.is_empty() {
            while let Some(x) = self.input.pop() {
                self.output.push(x);
            }
        }
        self.output.pop()
    }
}

fn main() {
    let mut q = QueueViaStacks::new();
    q.enqueue(1);
    q.enqueue(2);
    q.enqueue(3);
    println!("{:?} {:?}", q.dequeue(), q.dequeue());
}
