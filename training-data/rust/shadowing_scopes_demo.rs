// Shadowing: a new `let` reuses a name, can change type, and is scoped.
fn main() {
    let x = 5;
    let x = x * 2; // shadows the previous x
    println!("x = {}", x);

    {
        let x = "inner string"; // different type, only inside this block
        println!("inner x = {}", x);
    }
    println!("outer x = {}", x); // back to the integer

    // Type-changing transformation without inventing new names.
    let input = "  42  ";
    let input = input.trim();
    let input: i32 = input.parse().unwrap();
    println!("parsed = {}", input + 1);

    // Unlike `mut`, shadowing leaves the earlier binding immutable.
    let count = 0;
    let count = count + 1;
    println!("count = {}", count);

    let mut total = 0;
    for i in 1..=3 {
        let i = i * i; // shadows loop variable
        total += i;
    }
    println!("total = {}", total);

    // Shadowing inside a match arm
    let value = Some(7);
    match value {
        Some(value) => println!("got {}", value),
        None => println!("none"),
    }
}
