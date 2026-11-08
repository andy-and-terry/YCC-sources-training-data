fn encode(xs: &[i32]) -> Vec<i32> {
    let mut d = vec![xs[0]];
    d.extend(xs.windows(2).map(|w| w[1] - w[0]));
    d
}

fn decode(ds: &[i32]) -> Vec<i32> {
    ds.iter().scan(0, |acc, &d| { *acc += d; Some(*acc) }).collect()
}

fn main() {
    let d = encode(&[10, 12, 15, 15, 20]);
    println!("{:?} {:?}", d, decode(&d));
}
