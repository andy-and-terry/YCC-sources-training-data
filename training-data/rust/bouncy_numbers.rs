// Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
fn is_bouncy(n: u32) -> bool {
    let d: Vec<char> = n.to_string().chars().collect();
    let inc = d.windows(2).all(|w| w[0] <= w[1]);
    let dec = d.windows(2).all(|w| w[0] >= w[1]);
    !inc && !dec
}

fn main() {
    println!("{}", (1..1000).filter(|&n| is_bouncy(n)).count());
}
