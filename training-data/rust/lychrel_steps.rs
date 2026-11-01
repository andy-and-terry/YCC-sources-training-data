fn reverse(mut n: u64) -> u64 {
    let mut r = 0;
    while n > 0 {
        r = r * 10 + n % 10;
        n /= 10;
    }
    r
}

// Reverse-and-add until a palindrome; count the steps.
fn steps(mut n: u64) -> Option<u32> {
    for count in 0..50 {
        if count > 0 && n == reverse(n) {
            return Some(count);
        }
        n += reverse(n);
    }
    None
}

fn main() {
    for n in [56, 57, 59, 79, 89] {
        print!("{} ", steps(n).unwrap());
    }
    println!();
}
