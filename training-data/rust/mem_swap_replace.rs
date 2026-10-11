use std::mem;

fn main() {
    let mut a = String::from("left");
    let mut b = String::from("right");
    mem::swap(&mut a, &mut b);
    println!("{} {}", a, b);

    let old = mem::replace(&mut a, String::from("new"));
    println!("old={} a={}", old, a);

    let mut v = vec![1, 2, 3];
    let taken = mem::take(&mut v);
    println!("taken={:?} v={:?}", taken, v);

    let mut arr = [1, 2, 3, 4];
    arr.swap(0, 3);
    println!("{:?}", arr);
    println!("size of u64 = {}", mem::size_of::<u64>());
}
