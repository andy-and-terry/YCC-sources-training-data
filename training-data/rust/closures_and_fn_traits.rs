fn apply<F: Fn(i32) -> i32>(f: F, x: i32) -> i32 {
    f(x)
}

fn make_adder(n: i32) -> impl Fn(i32) -> i32 {
    move |x| x + n
}

fn make_counter() -> impl FnMut() -> i32 {
    let mut count = 0;
    move || {
        count += 1;
        count
    }
}

fn main() {
    println!("{}", apply(|x| x * 2, 5));

    let add5 = make_adder(5);
    println!("{}", add5(10));

    let mut counter = make_counter();
    println!("{} {} {}", counter(), counter(), counter());
}
