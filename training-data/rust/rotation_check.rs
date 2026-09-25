fn is_rotation(a: &str, b: &str) -> bool {
    a.len() == b.len() && a.repeat(2).contains(b)
}

fn main() {
    println!("{}", is_rotation("waterbottle", "erbottlewat"));
    println!("{}", is_rotation("abc", "acb"));
}
