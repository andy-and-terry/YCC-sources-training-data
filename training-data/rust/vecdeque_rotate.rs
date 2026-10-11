use std::collections::VecDeque;

fn main() {
    let mut d: VecDeque<i32> = (1..=6).collect();
    d.rotate_left(2);
    println!("{:?}", d);
    d.rotate_right(1);
    println!("{:?}", d);

    d.push_front(0);
    d.push_back(99);
    println!("front={:?} back={:?}", d.front(), d.back());

    while let Some(x) = d.pop_front() {
        if x > 3 {
            break;
        }
        print!("{} ", x);
    }
    println!();
    d.make_contiguous().sort();
    println!("{:?}", d);
}
