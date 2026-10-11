fn main() {
    let x = 5;
    let x = x * 2;
    {
        let x = "inner string";
        println!("inner x = {}", x);
    }
    println!("outer x = {}", x);

    let input = "42";
    let input: i32 = input.parse().unwrap();
    let input = input + 1;
    println!("parsed and incremented: {}", input);
}
