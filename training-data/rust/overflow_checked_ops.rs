fn main() {
    let a: u8 = 250;
    println!("{:?} {:?}", a.checked_add(5), a.checked_add(6));
    println!("{} {}", a.wrapping_add(10), a.saturating_add(10));
    println!("{:?}", a.overflowing_add(10));
    println!("{:?} {:?}", 5u32.checked_sub(6), i32::MIN.checked_abs());
    println!("{:?}", 10i32.checked_div(0));
    println!("{} {}", i32::MAX.wrapping_add(1), (-128i8).wrapping_neg());
    println!("{} {}", 7_i32.rem_euclid(3), (-7_i32).rem_euclid(3));
    println!("{} {}", (-7_i32) % 3, (-7_i32).div_euclid(3));
    println!("{:?}", u64::try_from(-1_i64).is_err());
    println!("{}", 200u8 as i8);
}
