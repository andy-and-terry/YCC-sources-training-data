// Narayana's cows N(n)=N(n-1)+N(n-3)
fn main() {
    let mut v: Vec<u64> = vec![1, 1, 1];
    for i in 3..10 {
        let next = v[i - 1] + v[i - 3];
        v.push(next);
    }
    println!("{:?}", v);
}
