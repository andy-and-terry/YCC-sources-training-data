// Cantor pairing function and its inverse.
fn pair(x: u64, y: u64) -> u64 {
    (x + y) * (x + y + 1) / 2 + y
}

fn unpair(z: u64) -> (u64, u64) {
    let w = (((8 * z + 1) as f64).sqrt() as u64 - 1) / 2;
    let y = z - w * (w + 1) / 2;
    (w - y, y)
}

fn main() {
    println!("{}", pair(3, 4));
    let (x, y) = unpair(32);
    println!("{} {}", x, y);
}
