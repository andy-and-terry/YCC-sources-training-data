struct CircularBuffer<T> {
    buffer: Vec<Option<T>>,
    capacity: usize,
    head: usize,
    size: usize,
}

impl<T: Clone> CircularBuffer<T> {
    fn new(capacity: usize) -> Self {
        CircularBuffer { buffer: vec![None; capacity], capacity, head: 0, size: 0 }
    }

    fn append(&mut self, item: T) {
        let tail = (self.head + self.size) % self.capacity;
        self.buffer[tail] = Some(item);
        if self.size < self.capacity {
            self.size += 1;
        } else {
            self.head = (self.head + 1) % self.capacity;
        }
    }

    fn to_vec(&self) -> Vec<T> {
        (0..self.size).map(|i| self.buffer[(self.head + i) % self.capacity].clone().unwrap()).collect()
    }
}

fn main() {
    let mut cb = CircularBuffer::new(3);
    for i in 0..5 {
        cb.append(i);
    }
    println!("{:?}", cb.to_vec());
}
