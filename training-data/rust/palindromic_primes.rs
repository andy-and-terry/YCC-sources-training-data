fn is_prime(n: u32) -> bool {
    n >= 2 && (2..).take_while(|i| i * i <= n).all(|i| n % i != 0)
}

fn is_palindrome(n: u32) -> bool {
    let s = n.to_string();
    s.chars().eq(s.chars().rev())
}

fn main() {
    let v: Vec<u32> = (0..200).filter(|&n| is_palindrome(n) && is_prime(n)).collect();
    println!("{:?}", v); // [2, 3, 5, 7, 11, 101, 131, 151, 181, 191]
}
