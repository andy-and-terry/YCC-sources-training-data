struct BitSet {
    bits: u64,
}

impl BitSet {
    fn new() -> Self { BitSet { bits: 0 } }
    fn insert(&mut self, i: u32) { self.bits |= 1 << i; }
    fn remove(&mut self, i: u32) { self.bits &= !(1 << i); }
    fn contains(&self, i: u32) -> bool { self.bits >> i & 1 == 1 }
    fn len(&self) -> u32 { self.bits.count_ones() }
    fn iter(&self) -> impl Iterator<Item = u32> + '_ {
        (0..64).filter(move |&i| self.contains(i))
    }
}

fn main() {
    let mut s = BitSet::new();
    for i in [3, 5, 8, 13, 21, 5] {
        s.insert(i);
    }
    s.remove(8);
    println!("len={} has13={} has8={}", s.len(), s.contains(13), s.contains(8));
    println!("{:?}", s.iter().collect::<Vec<_>>());
    println!("{:#b} lowest={}", s.bits, s.bits.trailing_zeros());
}
