// Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
fn is_munchausen(n: u32) -> bool {
    let total: u32 = n
        .to_string()
        .chars()
        .map(|c| c.to_digit(10).unwrap())
        .map(|d| if d == 0 { 0 } else { d.pow(d) })
        .sum();
    total == n
}

fn main() {
    let out: Vec<String> = (1..5000).filter(|&n| is_munchausen(n)).map(|n| n.to_string()).collect();
    println!("{}", out.join(" "));
}
