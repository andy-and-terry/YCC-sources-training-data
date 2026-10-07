fn gray_code(n: u32) -> Vec<u32> {
    (0..1u32 << n).map(|i| i ^ (i >> 1)).collect()
}

fn from_gray(mut g: u32) -> u32 {
    let mut n = 0;
    while g != 0 {
        n ^= g;
        g >>= 1;
    }
    n
}

fn main() {
    let codes = gray_code(3);
    let fmt: Vec<String> = codes.iter().map(|c| format!("{:03b}", c)).collect();
    println!("{:?}", fmt);
    let ok = codes.windows(2).all(|w| (w[0] ^ w[1]).count_ones() == 1);
    println!("{}", ok);
    println!("{:?}", codes.iter().map(|&c| from_gray(c)).collect::<Vec<_>>());
}
