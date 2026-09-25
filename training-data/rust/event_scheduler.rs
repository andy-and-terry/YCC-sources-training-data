use std::cmp::Ordering;
use std::collections::BinaryHeap;

#[derive(Debug)]
enum Kind {
    Arrive { customer: usize, service: f64 },
    Depart { customer: usize },
}

struct Event {
    time: f64,
    seq: u64,
    kind: Kind,
}

impl PartialEq for Event {
    fn eq(&self, o: &Self) -> bool {
        self.cmp(o) == Ordering::Equal
    }
}
impl Eq for Event {}
impl PartialOrd for Event {
    fn partial_cmp(&self, o: &Self) -> Option<Ordering> {
        Some(self.cmp(o))
    }
}
impl Ord for Event {
    // reversed so BinaryHeap (a max-heap) pops the earliest event first
    fn cmp(&self, o: &Self) -> Ordering {
        o.time.total_cmp(&self.time).then(o.seq.cmp(&self.seq))
    }
}

fn main() {
    let mut q = BinaryHeap::new();
    let mut seq = 0;
    let mut push = |q: &mut BinaryHeap<Event>, time: f64, kind: Kind| {
        seq += 1;
        q.push(Event { time, seq, kind });
    };
    for (i, &(arrive, service)) in [(0.0, 3.0), (1.0, 2.0), (1.5, 4.0), (6.0, 1.0)].iter().enumerate() {
        push(&mut q, arrive, Kind::Arrive { customer: i, service });
    }
    let mut server_free = 0.0f64;
    while let Some(ev) = q.pop() {
        match ev.kind {
            Kind::Arrive { customer, service } => {
                let start = ev.time.max(server_free);
                server_free = start + service;
                println!("t={:4.1} c{} arrives, waits {:.1}", ev.time, customer, start - ev.time);
                push(&mut q, server_free, Kind::Depart { customer });
            }
            Kind::Depart { customer } => println!("t={:4.1} c{} departs", ev.time, customer),
        }
    }
}
