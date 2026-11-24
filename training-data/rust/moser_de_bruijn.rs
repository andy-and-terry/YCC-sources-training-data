// Moser-de Bruijn sequence: binary digits of n read in base 4.
fn moser(mut n: u32) -> u32 {
    let (mut result, mut place) = (0, 1);
    while n > 0 {
        if n & 1 == 1 {
            result += place;
        }
        n >>= 1;
        place *= 4;
    }
    result
}

fn main() {
    let v: Vec<String> = (0..12).map(|n| moser(n).to_string()).collect();
    println!("{}", v.join(" "));
}
