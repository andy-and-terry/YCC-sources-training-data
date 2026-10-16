fn make_adder(n: i32) -> impl Fn(i32) -> i32 {
    move |x| x + n
}

fn make_counter() -> impl FnMut() -> u32 {
    let mut c = 0;
    move || {
        c += 1;
        c
    }
}

fn boxed_op(kind: &str) -> Box<dyn Fn(i32, i32) -> i32> {
    match kind {
        "add" => Box::new(|a, b| a + b),
        "mul" => Box::new(|a, b| a * b),
        _ => Box::new(|_, _| 0),
    }
}

fn main() {
    let add10 = make_adder(10);
    println!("{}", add10(5));

    let mut next = make_counter();
    println!("{} {} {}", next(), next(), next());

    for k in ["add", "mul", "nope"] {
        println!("{} -> {}", k, boxed_op(k)(6, 7));
    }
}
