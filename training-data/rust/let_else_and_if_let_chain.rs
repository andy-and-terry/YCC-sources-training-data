fn first_even(v: &[i32]) -> Option<i32> {
    let Some(&x) = v.iter().find(|&&n| n % 2 == 0) else { return None; };
    Some(x * 10)
}

fn main() {
    println!("{:?} {:?}", first_even(&[1, 3, 4]), first_even(&[1, 3]));
    let t = Some(("k", 5));
    if let Some((k, n)) = t { println!("{} {}", k, n); }
}
