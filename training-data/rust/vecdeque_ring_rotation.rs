use std::collections::VecDeque;

fn main() {
    let mut d: VecDeque<i32> = (1..=5).collect();
    d.rotate_left(2);
    println!("{:?}", d);
    d.rotate_right(1);
    println!("{:?}", d);
    d.push_front(0);
    d.push_back(9);
    println!("{:?} {:?} {:?}", d.front(), d.back(), d.get(2));
    let (a, b) = d.as_slices();
    println!("{}", a.len() + b.len());
    d.make_contiguous().sort();
    println!("{:?}", d);
    let drained: Vec<_> = d.drain(..3).collect();
    println!("{:?} {:?}", drained, d);
    d.truncate(1);
    println!("{:?} {}", d, d.contains(&9));
    let mut window: VecDeque<i32> = VecDeque::with_capacity(3);
    for x in 1..=6 {
        if window.len() == 3 {
            window.pop_front();
        }
        window.push_back(x);
    }
    println!("{:?}", window);
}
