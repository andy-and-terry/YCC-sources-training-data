fn main() {
    let some: Option<i32> = Some(4);
    let none: Option<i32> = None;
    println!("{:?} {:?}", some.map(|x| x * 2), none.map(|x| x * 2));
    println!("{:?}", some.and_then(|x| if x > 3 { Some(x) } else { None }));
    println!("{} {}", none.unwrap_or(0), none.unwrap_or_else(|| -1));
    println!("{:?} {:?}", some.filter(|x| x % 2 == 1), some.or(Some(9)));
    println!("{:?} {:?}", some.xor(none), some.zip(Some('a')));
    println!("{:?}", some.ok_or("missing"));
    println!("{:?}", none.ok_or_else(|| "missing".to_string()));
    println!("{}", some.map_or("no".to_string(), |v| format!("v={v}")));
    println!("{}", some.is_some_and(|v| v > 2));
    let nested: Option<Option<i32>> = Some(Some(1));
    println!("{:?}", nested.flatten());
    let opts = vec![Some(1), None, Some(3)];
    println!("{:?} {:?}", opts.iter().flatten().sum::<i32>(), opts.iter().cloned().collect::<Option<Vec<_>>>());
}
