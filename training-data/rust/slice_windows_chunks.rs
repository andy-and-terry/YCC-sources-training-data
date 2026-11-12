fn main() {
    let v = [1, 4, 9, 16, 25];
    let diffs: Vec<i32> = v.windows(2).map(|w| w[1] - w[0]).collect();
    println!("{:?}", diffs);
    for c in v.chunks(2) { println!("{:?}", c); }
}
