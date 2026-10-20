fn main() {
    let mut v: Vec<i32> = (1..=12).collect();
    v.retain(|x| x % 3 != 0);
    println!("{:?}", v);
    let drained: Vec<i32> = v.drain(2..5).collect();
    println!("{:?} {:?}", drained, v);
    let mut w = vec![1, 1, 2, 2, 2, 3, 1, 1];
    w.dedup();
    println!("{:?}", w);
    let mut names = vec!["apple", "avocado", "banana", "blueberry", "cherry"];
    names.dedup_by_key(|s| s.chars().next());
    println!("{:?}", names);
    let mut x = vec![1, 2, 3, 4, 5];
    let removed = x.swap_remove(1);
    println!("{removed} {:?}", x);
    x.insert(1, 99);
    x.extend_from_slice(&[7, 8]);
    x.truncate(5);
    println!("{:?}", x);
    let tail = x.split_off(3);
    println!("{:?} {:?}", x, tail);
    let mut y = vec![0; 3];
    y.splice(1..2, [5, 6, 7]);
    println!("{:?}", y);
    x.resize(5, -1);
    println!("{:?}", x);
}
