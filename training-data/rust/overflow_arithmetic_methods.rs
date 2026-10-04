fn main() {
    let a: u8 = 250;
    println!("checked_add: {:?}", a.checked_add(5));
    println!("checked_add: {:?}", a.checked_add(6));
    println!("wrapping_add: {}", a.wrapping_add(10));
    println!("saturating_add: {}", a.saturating_add(10));
    println!("overflowing_add: {:?}", a.overflowing_add(10));

    let b: i8 = -128;
    println!("wrapping_neg: {}", b.wrapping_neg());
    println!("checked_abs: {:?}", b.checked_abs());
    println!("saturating_sub: {}", b.saturating_sub(1));
    println!("unsigned_abs: {}", b.unsigned_abs());

    println!("checked_div: {:?}", 10i32.checked_div(0));
    println!("rem_euclid: {} vs %: {}", (-7i32).rem_euclid(3), -7i32 % 3);
    println!("div_euclid: {} vs /: {}", (-7i32).div_euclid(3), -7i32 / 3);
    println!("pow: {:?}", 2u32.checked_pow(31));
    println!("pow: {:?}", 2u32.checked_pow(32));

    println!("{} {} {}", 300i32 as u8, -1i32 as u32, 3.99f64 as i32);
    println!("{} {}", f64::NAN as i32, 1e20f64 as i32);
    println!("{} {} {}", u32::MAX.count_ones(), 40u32.leading_zeros(), 40u32.trailing_zeros());
    println!("{} {}", i64::MAX, i64::MIN);

    let total: Option<u32> = [100u32, 200, 300].iter().try_fold(0u32, |acc, &x| acc.checked_add(x));
    println!("{:?}", total);
}
