fn double(x: i32) -> i32 { x * 2 }
fn square(x: i32) -> i32 { x * x }
fn negate(x: i32) -> i32 { -x }

fn apply_all(fs: &[(&str, fn(i32) -> i32)], v: i32) {
    for (name, f) in fs {
        println!("{}({}) = {}", name, v, f(v));
    }
}

fn compose(f: fn(i32) -> i32, g: fn(i32) -> i32) -> impl Fn(i32) -> i32 {
    move |x| g(f(x))
}

fn main() {
    let table: [(&str, fn(i32) -> i32); 3] = [("double", double), ("square", square), ("negate", negate)];
    apply_all(&table, 7);
    let both = compose(double, square);
    println!("square(double(3)) = {}", both(3));
    let strs: Vec<String> = [1, 2, 3].iter().map(ToString::to_string).collect();
    println!("{:?}", strs);
}
