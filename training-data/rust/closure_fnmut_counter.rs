fn make_counter() -> impl FnMut() -> u32 {
    let mut c = 0;
    move || { c += 1; c }
}

fn apply_n(mut f: impl FnMut() -> u32, n: usize) -> Vec<u32> {
    (0..n).map(|_| f()).collect()
}

fn main() {
    println!("{:?}", apply_n(make_counter(), 4));
}
