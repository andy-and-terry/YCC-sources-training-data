fn moser_de_bruijn(mut i: u64) -> u64 {
    let (mut value, mut power) = (0, 1);
    while i > 0 {
        if i & 1 == 1 {
            value += power;
        }
        power *= 4;
        i >>= 1;
    }
    value
}

fn main() {
    let v: Vec<u64> = (0..10).map(moser_de_bruijn).collect();
    println!("{:?}", v); // [0, 1, 4, 5, 16, 17, 20, 21, 64, 65]
}
