fn main() {
    let names = ["a", "b", "c"];
    let ages = [10, 20, 30];
    let pairs: Vec<_> = names.iter().zip(ages.iter()).collect();
    println!("{:?}", pairs);
    let (ns, as_): (Vec<&&str>, Vec<&i32>) = pairs.into_iter().unzip();
    println!("{:?} {:?}", ns, as_);
    for (i, n) in names.iter().enumerate() { print!("{}{} ", i, n); }
    println!();
}
