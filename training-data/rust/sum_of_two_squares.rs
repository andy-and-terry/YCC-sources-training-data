// Positive n expressible as a*a + b*b with a, b >= 0.
fn representable(n: u32) -> bool {
    (0..).take_while(|a| a * a <= n).any(|a| {
        let b2 = n - a * a;
        let b = (b2 as f64).sqrt().round() as u32;
        b * b == b2
    })
}

fn main() {
    let v: Vec<String> = (1..=30)
        .filter(|&n| representable(n))
        .map(|n| n.to_string())
        .collect();
    println!("{}", v.join(" "));
}
