// Const generics: the capacity N is part of the type, so the buffer
// is a fixed-size array embedded directly in the struct -- no heap
// allocation, and RingBuffer<i32, 4> and RingBuffer<i32, 8> are
// distinct, non-interchangeable types checked at compile time.

struct RingBuffer<T, const N: usize> {
    data: [Option<T>; N],
    head: usize,
    len: usize,
}

impl<T: Copy, const N: usize> RingBuffer<T, N> {
    fn new() -> Self {
        RingBuffer { data: [None; N], head: 0, len: 0 }
    }

    fn push(&mut self, value: T) -> Option<T> {
        let tail = (self.head + self.len) % N;
        let evicted = if self.len == N {
            let evicted = self.data[self.head];
            self.head = (self.head + 1) % N;
            evicted
        } else {
            self.len += 1;
            None
        };
        self.data[tail] = Some(value);
        evicted
    }

    fn to_vec(&self) -> Vec<T> {
        (0..self.len)
            .map(|i| self.data[(self.head + i) % N].unwrap())
            .collect()
    }
}

fn main() {
    let mut buf: RingBuffer<i32, 4> = RingBuffer::new();
    for v in 1..=6 {
        let evicted = buf.push(v);
        if let Some(e) = evicted {
            println!("pushed {v}, evicted {e}");
        } else {
            println!("pushed {v}");
        }
    }
    println!("{:?}", buf.to_vec());
}
