fn is_prime(n: u32) -> bool {
    n >= 2 && (2..).take_while(|i| i * i <= n).all(|i| n % i != 0)
}

fn reverse(n: u32) -> u32 {
    n.to_string().chars().rev().collect::<String>().parse().unwrap()
}

fn main() {
    let v: Vec<u32> = (2..200)
        .filter(|&p| reverse(p) != p && is_prime(p) && is_prime(reverse(p)))
        .collect();
    println!("{:?}", v); // [13, 17, 31, 37, 71, 73, 79, 97, 107, ...]
}
