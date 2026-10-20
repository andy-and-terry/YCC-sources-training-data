macro_rules! my_vec {
    () => { Vec::new() };
    ($($x:expr),+ $(,)?) => {{ let mut v = Vec::new(); $(v.push($x);)+ v }};
}

macro_rules! maxm {
    ($x:expr) => { $x };
    ($x:expr, $($rest:expr),+) => {{ let a = $x; let b = maxm!($($rest),+); if a > b { a } else { b } }};
}

fn main() {
    let v: Vec<i32> = my_vec![1, 2, 3,];
    println!("{:?} {}", v, maxm!(3, 9, 4));
}
