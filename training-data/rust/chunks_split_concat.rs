fn main() {
    let v: Vec<i32> = (1..=7).collect();
    for c in v.chunks(3) { print!("{:?}", c); }
    println!();
    let parts: Vec<&[i32]> = v.split(|x| x % 3 == 0).collect();
    println!("{:?}", parts);
    println!("{:?}", [[1, 2], [3, 4]].concat());
    println!("{:?}", ["a", "b"].join("-"));
}
