fn main() {
    let names = ["ann", "bob", "cy"];
    let ages = [31, 25, 47];
    let pairs: Vec<(&str, i32)> = names.iter().copied().zip(ages.iter().copied()).collect();
    println!("{:?}", pairs);

    let (n, a): (Vec<&str>, Vec<i32>) = pairs.iter().cloned().unzip();
    println!("{:?} {:?}", n, a);

    let dot: i32 = a.iter().zip(a.iter()).map(|(x, y)| x * y).sum();
    println!("sum of squares = {}", dot);

    for (i, name) in names.iter().enumerate().skip(1) {
        println!("{}: {}", i, name);
    }
}
