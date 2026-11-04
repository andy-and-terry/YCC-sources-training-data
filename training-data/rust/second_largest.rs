fn second_largest(xs: &[i32]) -> Option<i32> {
    let (mut first, mut second): (Option<i32>, Option<i32>) = (None, None);
    for &x in xs {
        match first {
            Some(f) if x > f => { second = first; first = Some(x); }
            None => first = Some(x),
            Some(f) if x < f && second.map_or(true, |s| x > s) => second = Some(x),
            _ => {}
        }
    }
    second
}

fn main() {
    println!("{:?}", second_largest(&[4, 9, 2, 9, 7]));
    println!("{:?}", second_largest(&[3, 3]));
}
