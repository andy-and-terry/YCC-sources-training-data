// Leyland numbers: x^y + y^x for x >= y >= 2.
fn leyland(x: u64, y: u64) -> u64 {
    x.pow(y as u32) + y.pow(x as u32)
}

fn main() {
    let mut out = Vec::new();
    for x in 2..=4 {
        for y in 2..=x {
            out.push(leyland(x, y).to_string());
        }
    }
    println!("{}", out.join(" "));
}
