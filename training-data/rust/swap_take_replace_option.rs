use std::mem;

#[derive(Debug, Default)]
struct Buffer {
    data: Vec<u8>,
    name: Option<String>,
}

impl Buffer {
    fn drain_all(&mut self) -> Vec<u8> {
        mem::take(&mut self.data)
    }
}

fn main() {
    let mut b = Buffer { data: vec![1, 2, 3], name: Some("x".into()) };
    let old = b.drain_all();
    println!("{:?} {:?}", old, b);
    let name = b.name.take();
    println!("{:?} {:?}", name, b.name);
    let prev = b.name.replace("y".into());
    println!("{:?} {:?}", prev, b.name);
    let got = b.name.get_or_insert_with(|| "z".into());
    got.push('!');
    println!("{:?}", b.name);
    let mut x = 1;
    let mut y = 2;
    mem::swap(&mut x, &mut y);
    println!("{x} {y} {}", mem::replace(&mut x, 10));
}
