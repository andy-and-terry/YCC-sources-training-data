use std::cell::Cell;

// Cell<T> allows mutating a field through a shared (&self) reference
// for Copy types, by moving values in and out instead of handing out
// references the way RefCell does -- no runtime borrow checks needed.
struct HitCounter {
    hits: Cell<u32>,
    misses: Cell<u32>,
}

impl HitCounter {
    fn new() -> Self {
        HitCounter { hits: Cell::new(0), misses: Cell::new(0) }
    }

    // Only `&self`, yet this mutates state.
    fn record(&self, hit: bool) {
        if hit {
            self.hits.set(self.hits.get() + 1);
        } else {
            self.misses.set(self.misses.get() + 1);
        }
    }

    fn hit_rate(&self) -> f64 {
        let hits = self.hits.get() as f64;
        let total = hits + self.misses.get() as f64;
        if total == 0.0 { 0.0 } else { hits / total }
    }
}

fn main() {
    let counter = HitCounter::new();
    for hit in [true, true, false, true, false] {
        counter.record(hit);
    }
    println!("hits={}, misses={}", counter.hits.get(), counter.misses.get());
    println!("hit rate: {:.2}", counter.hit_rate());

    // Cell::replace swaps in a new value and returns the old one.
    let cell = Cell::new(10);
    let old = cell.replace(20);
    println!("old={}, new={}", old, cell.get());

    // Cell::take is shorthand for replace with the type's Default.
    let taken = cell.take();
    println!("taken={}, now={}", taken, cell.get());
}
