fn lis_length(a: &[i32]) -> usize {
    let mut tails: Vec<i32> = Vec::new();
    for &x in a {
        let i = tails.partition_point(|&t| t < x);
        if i == tails.len() {
            tails.push(x);
        } else {
            tails[i] = x;
        }
    }
    tails.len()
}

fn main() {
    println!("{}", lis_length(&[10, 9, 2, 5, 3, 7, 101, 18]));
}
