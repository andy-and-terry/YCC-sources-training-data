fn main() {
    let v: Vec<i32> = (1..=10).collect();
    let (even, odd): (Vec<i32>, Vec<i32>) = v.iter().partition(|&&x| x % 2 == 0);
    println!("{:?} {:?}", even, odd);

    let mut w = v.clone();
    w.retain(|x| x % 3 != 0);
    println!("retain: {:?}", w);

    let drained: Vec<i32> = w.drain(1..4).collect();
    println!("drained {:?} left {:?}", drained, w);

    let mut x = vec![1, 1, 2, 2, 2, 3, 1];
    x.dedup();
    println!("dedup: {:?}", x);

    let mut y = vec![10, 11, 20, 25, 31];
    y.dedup_by_key(|n| *n / 10);
    println!("dedup_by_key: {:?}", y);

    y.extend_from_slice(&[7, 8]);
    y.truncate(3);
    println!("{:?}", y);
}
