// Less common Option combinators: zip, xor, filter, and take/replace.
fn main() {
    let name = Some("Ada");
    let age = Some(36);
    println!("{:?}", name.zip(age));
    println!("{:?}", name.zip(None::<i32>));

    let a = Some(1);
    let b: Option<i32> = None;
    println!("{:?} {:?} {:?}", a.xor(b), a.xor(Some(2)), b.xor(b));

    let even = Some(10).filter(|n| n % 2 == 0);
    let odd = Some(7).filter(|n| n % 2 == 0);
    println!("{:?} {:?}", even, odd);

    let mut slot = Some(5);
    let old = slot.replace(9);
    println!("{:?} {:?}", old, slot);
    let taken = slot.take();
    println!("{:?} {:?}", taken, slot);

    let (x, y): (Vec<_>, Vec<_>) = Some((1, 'a')).into_iter().unzip();
    println!("{:?} {:?}", x, y);
}
