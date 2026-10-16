fn main() {
    let parts = ["alpha", "beta", "gamma"];
    println!("{}", parts.join(", "));
    println!("{}", parts.concat());

    let nested = vec![vec![1, 2], vec![3], vec![4, 5]];
    println!("{:?}", nested.concat());
    println!("{:?}", nested.join(&0));

    let mut s = String::new();
    for (i, p) in parts.iter().enumerate() {
        if i > 0 {
            s.push_str(" | ");
        }
        s.push_str(&p.to_uppercase());
    }
    println!("{}", s);
    println!("{}", "ab".repeat(3));
}
