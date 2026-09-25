use std::collections::VecDeque;
use std::sync::{Arc, Condvar, Mutex};
use std::thread;

// A bounded blocking queue: producers wait on `not_full` when the queue is
// at capacity, consumers wait on `not_empty` when it has nothing to take.
struct BoundedQueue {
    state: Mutex<VecDeque<i32>>,
    not_empty: Condvar,
    not_full: Condvar,
    capacity: usize,
}

impl BoundedQueue {
    fn new(capacity: usize) -> Self {
        BoundedQueue {
            state: Mutex::new(VecDeque::new()),
            not_empty: Condvar::new(),
            not_full: Condvar::new(),
            capacity,
        }
    }

    fn push(&self, value: i32) {
        let mut queue = self.state.lock().unwrap();
        while queue.len() == self.capacity {
            queue = self.not_full.wait(queue).unwrap();
        }
        queue.push_back(value);
        self.not_empty.notify_one();
    }

    fn pop(&self) -> i32 {
        let mut queue = self.state.lock().unwrap();
        while queue.is_empty() {
            queue = self.not_empty.wait(queue).unwrap();
        }
        let value = queue.pop_front().unwrap();
        self.not_full.notify_one();
        value
    }
}

fn main() {
    let queue = Arc::new(BoundedQueue::new(2));

    let producer_queue = Arc::clone(&queue);
    let producer = thread::spawn(move || {
        for i in 0..6 {
            producer_queue.push(i);
        }
    });

    let consumer_queue = Arc::clone(&queue);
    let consumer = thread::spawn(move || {
        let mut received = Vec::new();
        for _ in 0..6 {
            received.push(consumer_queue.pop());
        }
        received
    });

    producer.join().unwrap();
    let received = consumer.join().unwrap();
    println!("{:?}", received);
}
