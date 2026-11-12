use std::mem;

fn main() {
    let mut a = String::from("a");
    let mut b = String::from("b");
    mem::swap(&mut a, &mut b);
    let old = mem::replace(&mut a, "new".to_string());
    let taken = mem::take(&mut b);
    println!("{} {} {} [{}]", a, old, taken, b);
}
