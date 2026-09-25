const fn to_gray(n: u32) -> u32 {
    n ^ (n >> 1)
}

const fn from_gray(mut g: u32) -> u32 {
    let mut shift = 1;
    while shift < 32 {
        g ^= g >> shift;
        shift <<= 1;
    }
    g
}

const _: () = assert!(from_gray(to_gray(123456)) == 123456);

fn main() {
    let codes: Vec<u32> = (0..16).map(to_gray).collect();
    for (i, g) in codes.iter().enumerate() {
        println!("{:2} {:04b} {:2}", i, g, from_gray(*g));
    }
    let ok = codes.windows(2).all(|w| (w[0] ^ w[1]).count_ones() == 1);
    println!("adjacent differ by one bit: {}", ok);
}
