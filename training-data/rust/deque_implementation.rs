struct RingDeque<T> {
    buf: Vec<Option<T>>,
    head: usize,
    len: usize,
}

impl<T> RingDeque<T> {
    fn new() -> Self {
        RingDeque { buf: Vec::new(), head: 0, len: 0 }
    }

    fn grow(&mut self) {
        if self.len < self.buf.len() {
            return;
        }
        let cap = (self.buf.len() * 2).max(4);
        let mut nb: Vec<Option<T>> = (0..cap).map(|_| None).collect();
        for (i, slot) in nb.iter_mut().enumerate().take(self.len) {
            let idx = (self.head + i) % self.buf.len();
            *slot = self.buf[idx].take();
        }
        self.buf = nb;
        self.head = 0;
    }

    fn push_back(&mut self, x: T) {
        self.grow();
        let idx = (self.head + self.len) % self.buf.len();
        self.buf[idx] = Some(x);
        self.len += 1;
    }

    fn push_front(&mut self, x: T) {
        self.grow();
        self.head = (self.head + self.buf.len() - 1) % self.buf.len();
        self.buf[self.head] = Some(x);
        self.len += 1;
    }

    fn pop_front(&mut self) -> Option<T> {
        if self.len == 0 {
            return None;
        }
        let x = self.buf[self.head].take();
        self.head = (self.head + 1) % self.buf.len();
        self.len -= 1;
        x
    }

    fn pop_back(&mut self) -> Option<T> {
        if self.len == 0 {
            return None;
        }
        self.len -= 1;
        let idx = (self.head + self.len) % self.buf.len();
        self.buf[idx].take()
    }

    fn iter(&self) -> impl Iterator<Item = &T> {
        (0..self.len).filter_map(move |i| self.buf[(self.head + i) % self.buf.len()].as_ref())
    }
}

fn main() {
    let mut d = RingDeque::new();
    for i in 0..5 {
        d.push_back(i);
        d.push_front(-i);
    }
    println!("{:?}", d.iter().collect::<Vec<_>>());
    println!("{:?} {:?} {}", d.pop_front(), d.pop_back(), d.len);
    let mut e: RingDeque<String> = RingDeque::new();
    println!("{:?}", e.pop_back());
}
