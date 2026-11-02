fn main() {
    let a: Option<i32> = Some(4);
    println!("{:?}", a.map(|x| x * 2).filter(|x| *x > 5).unwrap_or(0));
    println!("{:?}", None::<i32>.or(Some(1)).and_then(|x| x.checked_sub(5)));
}
