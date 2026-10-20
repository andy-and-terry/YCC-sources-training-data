fn main() {
    let x = 5;
    let x = x * 2;
    let label = {
        let x = x + 1;
        if x > 10 { "big" } else { "small" }
    };
    let y = loop { break x * 3; };
    println!("{} {} {}", x, label, y);
}
