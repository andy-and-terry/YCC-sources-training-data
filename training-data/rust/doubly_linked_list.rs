use std::collections::VecDeque;

fn main() {
    let mut dll: VecDeque<i32> = VecDeque::new();
    for v in [1, 2, 3, 4] {
        dll.push_back(v);
    }
    if let Some(pos) = dll.iter().position(|&x| x == 3) {
        dll.remove(pos);
    }
    println!("{:?}", dll);
}
