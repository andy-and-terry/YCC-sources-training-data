fn main() {
    let a: u8 = 250;
    println!("{:?} {:?}", a.checked_add(10), a.checked_add(5));
    println!("{} {}", a.wrapping_add(10), a.saturating_add(10));
    println!("{:?}", a.overflowing_add(10));
    println!("{} {}", i32::MAX.wrapping_add(1), (-7i32).rem_euclid(3));
    println!("{} {}", 7u32.pow(2), 2f64.powi(10));
}
