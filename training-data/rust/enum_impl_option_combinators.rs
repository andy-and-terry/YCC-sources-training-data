fn main() {
    let a: Option<i32> = Some(4);
    println!("{:?}", a.map(|x| x * 2).filter(|x| *x > 5).unwrap_or(0));
    println!("{:?}", a.and_then(|x| x.checked_sub(10)).or(Some(-1)));
    let r: Result<i32, String> = "12".parse::<i32>().map_err(|e| e.to_string());
    println!("{:?}", r);
}
