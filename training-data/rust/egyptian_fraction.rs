fn egyptian(mut num: u64, mut den: u64) -> Vec<u64> {
    let mut out = Vec::new();
    while num != 0 {
        let d = (den + num - 1) / num;
        out.push(d);
        num = num * d - den;
        den *= d;
    }
    out
}

fn main() {
    let r = egyptian(4, 13);
    println!("{:?}", r);
    assert_eq!(r, vec![4, 18, 468]);
}
