fn ordinal(n: u32) -> String {
    let suffix = match (n % 100, n % 10) {
        (11..=13, _) => "th",
        (_, 1) => "st",
        (_, 2) => "nd",
        (_, 3) => "rd",
        _ => "th",
    };
    format!("{n}{suffix}")
}

fn main() {
    let v: Vec<String> = [1, 2, 3, 4, 11, 12, 13, 21, 101, 111].iter().map(|&n| ordinal(n)).collect();
    println!("{}", v.join(" "));
}
