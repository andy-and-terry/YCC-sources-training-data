// Sylvester's sequence: s(0) = 2, s(n+1) = s(n)^2 - s(n) + 1
// u128 holds s(0)..s(7); s(8) would overflow, so stop updating after s(7).
fn main() {
    let mut s: u128 = 2;
    for i in 0..8 {
        println!("s({}) = {}", i, s);
        if i < 7 {
            s = s * s - s + 1;
        }
    }
}
